(function ($) {

    'use strict';

    var EditableTable = {

        options: {
            addButton: '#addToTable-unit',
            table: '#datatable-editable-unit',            
            dialog: {
                wrapper: '#dialog',
                cancelButton: '#dialogCancel',
                confirmButton: '#dialogConfirm',
            }
        },

        initialize: function () {
            this
                .setVars()
                .build()
                .events();
        },

        setVars: function () {
            this.$table = $(this.options.table);
            this.$addButton = $(this.options.addButton);

            // dialog
            this.dialog = {};
            this.dialog.$wrapper = $(this.options.dialog.wrapper);
            this.dialog.$cancel = $(this.options.dialog.cancelButton);
            this.dialog.$confirm = $(this.options.dialog.confirmButton);

            return this;
        },

        build: function () {
            this.datatable = this.$table.DataTable({
                aoColumns: [
                    {"bSortable": false},
                    {"bSortable": false},                    
                    {"bSortable": false},
                    {"bSortable": false},
                ],
                "searching": false,
                'paging': false,
            });

            window.dt = this.datatable;

            return this;
        },

        events: function () {
            var _self = this;

            this.$table
                .on('click', 'a.save-row-unit', function (e) {
                    e.preventDefault();

                    _self.rowSave($(this).closest('tr'));
                })
                .on('click', 'a.cancel-row-unit', function (e) {
                    e.preventDefault();

                    _self.rowCancel($(this).closest('tr'));
                })
                .on('click', 'a.edit-row-unit', function (e) {
                    e.preventDefault();

                    _self.rowEdit($(this).closest('tr'));
                })
                .on('click', 'a.remove-row-unit', function (e) {
                    e.preventDefault();
                    var $row = $(this).closest('tr');
                    var values = [];
                    values = $row.find('td').map(function () {
                        var $this = $(this);

                        if ($this.hasClass('actions')) {
                            _self.rowSetActionsDefault($row);
                            return _self.datatable.cell(this).data();
                        }
                        else {
                            return $.trim($this.find('input').val());
                        }
                    });
                    swal({
                        title: "Are you sure you want to delete?",
                        text: "You will not be able to recover this!",
                        type: "error",
                        showCancelButton: true,
                        confirmButtonClass: 'btn-danger',
                        confirmButtonText: "Yes, delete it!",
                        cancelButtonClass: "btn-default"
                        //closeOnConfirm: false
                        }).catch(e => {}).then( function (isconfirm) {
                            if(isconfirm){
                                swal({                            
                                    type: "info",
                                    confirmButtonClass: 'btn-info',
                                    confirmButtonText: "OK",
                                    cancelButtonClass: "btn-default",
                                    html: htmlUnits,
                                    preConfirm: function () {
                                        return new Promise(function (resolve) {
                                            var units = [];
                                            var index = 0;
                                            units.push({});
                                            units[0]["id"] = $('.1')[0].id;
                                            units[0]["checked"] = $('.1')[0].checked? "1":"0";
                                            index = 1;
                                            for (var i = 1; i < count; i++) {                                                
                                                units.push({});
                                                units[index]["id"] = $('.'+(i+1))[0].id;
                                                units[index]["checked"] = $('.'+(i+1))[0].checked? "1":"0";
                                                index++;
                                            };
                                          resolve([                                            
                                            units
                                          ])
                                        })
                                      }
                                }).catch(e => {}).then(function(result){
                                    $.ajax({
                                        url:  $('#urlUnitDelete').text(),
                                        type: 'post',
                                        dataType: 'json',
                                        data: {id: _self.datatable.row($row.get(0)).data()[0],type: 'unit', unit_type:$('.survey-check:checked').val(),units: JSON.stringify(result)},
                                    })
                                    .done(function (response) {
                                        swal("Success!", response.message, "success");
                                        _self.rowRemove($row);
                                    })
                                    .fail(function (response) {
                                        swal("Error!", "Problem when processing request", "error");
                                        
                                    });
                                });
                        }
                    });
            });

            this.$addButton.on('click', function (e) {
                e.preventDefault();

                _self.rowAdd();
            });

            this.dialog.$cancel.on('click', function (e) {
                e.preventDefault();
                $.magnificPopup.close();
            });

            return this;
        },

        // ==========================================================================================
        // ROW FUNCTIONS
        // ==========================================================================================
        rowAdd: function () {
            this.$addButton.attr({'disabled': 'disabled'});

            var actions,
                data,
                $row;

            actions = [
                '<a href="#" class="hidden on-editing save-row-unit"><i class="fa fa-save"></i></a>',
                '<a href="#" class="hidden on-editing cancel-row-unit"><i class="fa fa-times"></i></a>',
                '<a href="#" class="on-default edit-row-unit"><i class="fa fa-pencil"></i></a>',
                '<a href="#" class="on-default remove-row-unit"><i class="fa fa-trash-o"></i></a>',
            ].join(' ');
            var rowNode = this.datatable.row.add(['','','', actions]).draw().node();
            //$row = this.datatable.row(data[0]).nodes().to$();

            $( rowNode )
                .addClass('adding')
                .find('td:last')
                .addClass('actions');
            
            this.rowEdit($( rowNode ));

           // this.datatable.order([0, 'asc']).draw(); // always show fields
        },

        rowCancel: function ($row) {
            var _self = this,
                $actions,
                i,
                data;

            if ($row.hasClass('adding')) {
                this.rowRemove($row);
            } else {

                data = this.datatable.row($row.get(0)).data();
                this.datatable.row($row.get(0)).data(data);

                $actions = $row.find('td.actions');
                if ($actions.get(0)) {
                    this.rowSetActionsDefault($row);
                }

                this.datatable.draw();
            }
        },

        rowEdit: function ($row) {
            var _self = this,
                data, index;

            data = this.datatable.row($row.get(0)).data();
            index = 0
            $row.children('td').each(function (i) {
                var $this = $(this);
                index++;
                if ($this.hasClass('actions')) {
                    _self.rowSetActionsEditing($row);
                } else if ($this.hasClass('readonly')) {
                    $this.html('<input readonly disabled type="text" class="form-control disabled readonly" value="' + data[i] + '"/>');
                } else if(index == 3){
                    var class_name = "";
                    if(index == 3){
                        class_name = "colorpicker-rgba";
                    }

                    $this.html('<input type="text" class="form-control input-block '+class_name+'" value="' + data[i] + '"/>');
                    $('.colorpicker-rgba').colorpicker({
                        format: 'hex'
                    });
                }
                else {
                    $this.html('<input type="text" class="form-control input-block" value="' + data[i] + '"/>');
                }
            });
        },

        rowSave: function ($row) {
            var _self = this,
                $actions,
                values = [],                
                $addNew;

            if ($row.hasClass('adding')) {
                this.$addButton.removeAttr('disabled');
                $row.removeClass('adding');
            }

            values = $row.find('td').map(function () {
                var $this = $(this);
                var value;

                if ($this.hasClass('actions')) {
                    _self.rowSetActionsDefault($row);
                    return _self.datatable.cell(this).data();
                }
                else {
                    value = $this.find('select').find(":selected").val();
                    if(value){
                        return value;
                    }
                    return $.trim($this.find('input').val());
                }
            });
            this.datatable.row($row.get(0)).data(values);

            $actions = $row.find('td.actions');
            if ($actions.get(0)) {
                this.rowSetActionsDefault($row);
            }
            $addNew = !$row.data('id');
            this.datatable.draw();

            swal({
                title: "Are you sure you want to update?",
                text: "You will not be able to recover this!",
                type: "info",
                showCancelButton: true,
                confirmButtonClass: 'btn-info',
                confirmButtonText: "Yes, update it!",
                cancelButtonClass: "btn-default"
                //closeOnConfirm: false
                }).catch(e => {}).then( function () {
                    swal({
                    //title: "Select the Unit(s) from the list that you would like these changes to apply to:",
                    type: "info",
                    confirmButtonClass: 'btn-info',
                    confirmButtonText: "OK",
                    cancelButtonClass: "btn-default",
                    html: htmlUnits_create_award_types,
                    preConfirm: function () {
                        return new Promise(function (resolve) {
                            var units = [];
                            var index = 0;
                            units.push({});
                            units[0]["id"] = $('.1')[0].id;
                            units[0]["checked"] = $('.1')[0].checked? "1":"0";
                            index = 1;
                            for (var i = 1; i < count; i++) {   
                                if ($('.'+(i+1)).length>0) {
                                     units.push({});
                                    units[index]["id"] = $('.'+(i+1))[0].id;
                                    units[index]["checked"] = $('.'+(i+1))[0].checked? "1":"0";
                                    index++;
                                }
                            };
                          resolve([                                            
                            units
                          ])
                        })
                      }
                    }).catch(e => {}).then(function(result){
                        $.ajax({
                            url: $('#urlUnitSave').text(),
                            type: 'post',
                            dataType: 'json',
                            data: {content: values[1], csstype : values[2], id: values[0], type: 'unit', unit_type:$('.survey-check:checked').val(),units: JSON.stringify(result)},
                        })
                        .done(function (response) {
                            swal("Success!", response.message, "success");
                            
                        })
                        .fail(function (response) {
                            swal("Error!", "Problem when processing request", "error");
                            
                        });
                    });
            });
        },

        rowRemove: function ($row) {
            if ($row.hasClass('adding')) {
                this.$addButton.removeAttr('disabled');
            }

            this.datatable.row($row.get(0)).remove().draw();
        },

        rowSetActionsEditing: function ($row) {
            $row.find('.on-editing').removeClass('hidden');
            $row.find('.on-default').addClass('hidden');
        },

        rowSetActionsDefault: function ($row) {
            $row.find('.on-editing').addClass('hidden');
            $row.find('.on-default').removeClass('hidden');               
        }

    };

    $(function () {
        EditableTable.initialize();
    });

}).apply(this, [jQuery]);

// employee
(function ($) {

    'use strict';

    var EditableTable = {

        options: {
            addButton: '#addToTable-employee',
            table: '#datatable-editable-employee',            
            dialog: {
                wrapper: '#dialog',
                cancelButton: '#dialogCancel',
                confirmButton: '#dialogConfirm',
            }
        },

        initialize: function () {
            this
                .setVars()
                .build()
                .events();
        },

        setVars: function () {
            this.$table = $(this.options.table);
            this.$addButton = $(this.options.addButton);

            // dialog
            this.dialog = {};
            this.dialog.$wrapper = $(this.options.dialog.wrapper);
            this.dialog.$cancel = $(this.options.dialog.cancelButton);
            this.dialog.$confirm = $(this.options.dialog.confirmButton);

            return this;
        },

        build: function () {
            this.datatable = this.$table.DataTable({
                aoColumns: [
                    {"bSortable": false},
                    {"bSortable": false},                    
                    {"bSortable": false},
                    {"bSortable": false},
                ],
                "searching": false,
                'paging': false,
            });

            window.dt = this.datatable;

            return this;
        },

        events: function () {
            var _self = this;

            this.$table
                .on('click', 'a.save-row-employee', function (e) {
                    e.preventDefault();

                    _self.rowSave($(this).closest('tr'));
                })
                .on('click', 'a.cancel-row-employee', function (e) {
                    e.preventDefault();

                    _self.rowCancel($(this).closest('tr'));
                })
                .on('click', 'a.edit-row-employee', function (e) {
                    e.preventDefault();

                    _self.rowEdit($(this).closest('tr'));
                })
                .on('click', 'a.remove-row-employee', function (e) {
                    e.preventDefault();
                    var $row = $(this).closest('tr');                    
                    swal({
                        title: "Are you sure you want to delete?",
                        text: "You will not be able to recover this!",
                        type: "error",
                        showCancelButton: true,
                        confirmButtonClass: 'btn-danger',
                        confirmButtonText: "Yes, delete it!",
                        cancelButtonClass: "btn-default"
                        //closeOnConfirm: false
                        }).catch(e => {}).then( function (isconfirm) {
                            if(isconfirm){
                                swal({                            
                                    type: "info",
                                    confirmButtonClass: 'btn-info',
                                    confirmButtonText: "OK",
                                    cancelButtonClass: "btn-default",
                                    html: htmlUnits,
                                    preConfirm: function () {
                                        return new Promise(function (resolve) {
                                            var units = [];
                                            var index = 0;
                                            units.push({});
                                            units[0]["id"] = $('.1')[0].id;
                                            units[0]["checked"] = $('.1')[0].checked? "1":"0";
                                            index = 1;
                                            for (var i = 1; i < count; i++) {                                                
                                                units.push({});
                                                units[index]["id"] = $('.'+(i+1))[0].id;
                                                units[index]["checked"] = $('.'+(i+1))[0].checked? "1":"0";
                                                index++;
                                            };
                                          resolve([                                            
                                            units
                                          ])
                                        })
                                      }
                                }).catch(e => {}).then(function(result){
                                    $.ajax({
                                        url:  $('#urlUnitDelete').text(),
                                        type: 'post',
                                        dataType: 'json',
                                        data: {id: _self.datatable.row($row.get(0)).data()[0],type: 'employee', unit_type:$('.survey-check:checked').val(),units: JSON.stringify(result)},
                                    })
                                    .done(function (response) {
                                        swal("Success!", response.message, "success");
                                        _self.rowRemove($row);
                                    })
                                    .fail(function (response) {
                                        swal("Error!", "Problem when processing request", "error");
                                        
                                    });
                                });
                        }
                    });
            });

            this.$addButton.on('click', function (e) {
                e.preventDefault();

                _self.rowAdd();
            });

            this.dialog.$cancel.on('click', function (e) {
                e.preventDefault();
                $.magnificPopup.close();
            });

            return this;
        },

        // ==========================================================================================
        // ROW FUNCTIONS
        // ==========================================================================================
        rowAdd: function () {
            this.$addButton.attr({'disabled': 'disabled'});

            var actions,
                data,
                $row;

            actions = [
                '<a href="#" class="hidden on-editing save-row-employee"><i class="fa fa-save"></i></a>',
                '<a href="#" class="hidden on-editing cancel-row-employee"><i class="fa fa-times"></i></a>',
                '<a href="#" class="on-default edit-row-employee"><i class="fa fa-pencil"></i></a>',
                '<a href="#" class="on-default remove-row-employee"><i class="fa fa-trash-o"></i></a>',
            ].join(' ');

           var rowNode  = this.datatable.row.add(['','','', actions]).draw().node();
            //$row = this.datatable.row(data[0]).nodes().to$();

            $( rowNode )
                .addClass('adding')
                .find('td:last')
                .addClass('actions');
            
            this.rowEdit($( rowNode ));
           // this.datatable.order([0, 'asc']).draw(); // always show fields
        },

        rowCancel: function ($row) {
            var _self = this,
                $actions,
                i,
                data;

            if ($row.hasClass('adding')) {
                this.rowRemove($row);
            } else {

                data = this.datatable.row($row.get(0)).data();
                this.datatable.row($row.get(0)).data(data);

                $actions = $row.find('td.actions');
                if ($actions.get(0)) {
                    this.rowSetActionsDefault($row);
                }

                this.datatable.draw();
            }
        },

        rowEdit: function ($row) {
            var _self = this,
                data, index;

            data = this.datatable.row($row.get(0)).data();
            index = 0;

            $row.children('td').each(function (i) {
                var $this = $(this);
                index++;
                ;
                if ($this.hasClass('actions')) {
                    _self.rowSetActionsEditing($row);
                } else if ($this.hasClass('readonly')) {
                    $this.html('<input readonly disabled type="text" class="form-control disabled readonly" value="' + data[i] + '"/>');
                }else if(index == 3){
                     var class_name = "";
                    if(index == 3){
                        class_name = "colorpicker-rgba";
                    }
                    $this.html('<input type="text" class="form-control input-block '+class_name+'" value="' + data[i] + '"/>');
                    $('.colorpicker-rgba').colorpicker({
                        format: 'hex'
                    });
                }
                 else {
                    $this.html('<input type="text" class="form-control input-block" value="' + data[i] + '"/>');
                }
            });
        },

        rowSave: function ($row) {
            var _self = this,
                $actions,
                values = [],                
                $addNew;

            if ($row.hasClass('adding')) {
                this.$addButton.removeAttr('disabled');
                $row.removeClass('adding');
            }

            values = $row.find('td').map(function () {
                var $this = $(this);
                var value;

                if ($this.hasClass('actions')) {
                    _self.rowSetActionsDefault($row);
                    return _self.datatable.cell(this).data();
                }
                else {
                    value = $this.find('select').find(":selected").val();
                    if(value){
                        return value;
                    }
                    return $.trim($this.find('input').val());
                }
            });
            this.datatable.row($row.get(0)).data(values);

            $actions = $row.find('td.actions');
            if ($actions.get(0)) {
                this.rowSetActionsDefault($row);
            }
            $addNew = !$row.data('id');
            this.datatable.draw();

            swal({
                title: "Are you sure you want to update?",
                text: "You will not be able to recover this!",
                type: "info",
                showCancelButton: true,
                confirmButtonClass: 'btn-info',
                confirmButtonText: "Yes, update it!",
                cancelButtonClass: "btn-default"
                //closeOnConfirm: false
                }).catch(e => {}).then( function () {
                    swal({
                    //title: "Select the Unit(s) from the list that you would like these changes to apply to:",
                    type: "info",
                    confirmButtonClass: 'btn-info',
                    confirmButtonText: "OK",
                    cancelButtonClass: "btn-default",
                    html: htmlUnits,
                    preConfirm: function () {
                                        return new Promise(function (resolve) {
                                            var units = [];
                                            var index = 0;
                                            units.push({});
                                            units[0]["id"] = $('.1')[0].id;
                                            units[0]["checked"] = $('.1')[0].checked? "1":"0";
                                            index = 1;
                                            for (var i = 1; i < count; i++) {                                                
                                                units.push({});
                                                units[index]["id"] = $('.'+(i+1))[0].id;
                                                units[index]["checked"] = $('.'+(i+1))[0].checked? "1":"0";
                                                index++;
                                            };
                                          resolve([                                            
                                            units
                                          ])
                                        })
                                      }
                    }).catch(e => {}).then(function(result){
                        $.ajax({
                            url:  $('#urlUnitSave').text(),
                            type: 'post',
                            dataType: 'json',
                            data: {content: values[1], csstype : values[2], id: values[0], type: 'employee', unit_type:$('.survey-check:checked').val(),units: JSON.stringify(result)},
                        })
                        .done(function (response) {
                            swal("Success!", response.message, "success");
                            
                        })
                        .fail(function (response) {
                            swal("Error!", "Problem when processing request", "error");
                            
                        });
                    });
            });
        },

        rowRemove: function ($row) {
            if ($row.hasClass('adding')) {
                this.$addButton.removeAttr('disabled');
            }

            this.datatable.row($row.get(0)).remove().draw();
        },

        rowSetActionsEditing: function ($row) {
            $row.find('.on-editing').removeClass('hidden');
            $row.find('.on-default').addClass('hidden');
        },

        rowSetActionsDefault: function ($row) {
            $row.find('.on-editing').addClass('hidden');
            $row.find('.on-default').removeClass('hidden');               
        }

    };

    $(function () {
        EditableTable.initialize();
    });

}).apply(this, [jQuery]);