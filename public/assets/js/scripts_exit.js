(function ($) {

    'use strict';

    var EditableTable = {

        options: {
            addButton: '#addToTable',
            table: '#datatable-editable',            
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
            this.datatable = this.$table.DataTable({'paging': false,});
            window.dt = this.datatable;

            return this;
        },

        events: function () {
            var _self = this;

            this.$table
            .on('click', 'a.save-row', function (e) {
                e.preventDefault();

                _self.rowSave($(this).closest('tr'));
            })
            .on('click', 'a.cancel-row', function (e) {
                e.preventDefault();

                _self.rowCancel($(this).closest('tr'));
            })
            .on('click', 'a.edit-row', function (e) {
                e.preventDefault();

                _self.rowEdit($(this).closest('tr'));
            })
            .on('click', 'a.remove-row', function (e) {
                e.preventDefault();

                var $row = $(this).closest('tr');

                $.magnificPopup.open({
                    items: {
                        src: _self.options.dialog.wrapper,
                        type: 'inline'
                    },
                    preloader: false,
                    modal: true,
                    callbacks: {
                        change: function () {
                            _self.dialog.$confirm.on('click', function (e) {
                                e.preventDefault();

                                _self.rowRemove($row);
                                $.magnificPopup.close();
                            });
                        },
                        close: function () {
                            _self.dialog.$confirm.off('click');
                        }
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
            $row,
            checkbox,
            id,
            checkvisiabled;

            actions = [
            '<a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>',
            '<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>',
            '<a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>',
            ].join(' ');
            id = Math.random().toString(36);
            checkbox = ['<div class="checkbox checkbox-success checkbox-circle"><input name="'+id+'" type="checkbox"><label></label></div>',
            ].join(' ');
            checkvisiabled = ['<div class="checkbox checkbox-danger checkbox-circle"><input name="'+id+'" type="checkbox"><label></label></div>',
            ].join(' ');
            
            data = this.datatable.row.add(['','','','', checkbox, checkvisiabled, actions]);
            $row = this.datatable.row(data[0]).nodes().to$();

            $row
            .addClass('adding')
            .find('td:last')
            .addClass('actions');
            
            this.rowEdit($row);

            this.datatable.order([0, 'asc']).draw(); // always show fields
            $('.colorpicker-rgba').colorpicker({
                format: 'hex'
            });

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

                if(index == 5 && !$this.hasClass('chkenabled'))
                    $this.addClass('chkenabled');
                else if(index == 6 && !$this.hasClass('chkvisiabled')){
                    $this.addClass('chkvisiabled');
                }
                else if(index == 1){
                    $this.addClass('readonly');
                }
				// index == 1 : column id of question
                if ($this.hasClass('actions') || $this.hasClass('chkenabled') || $this.hasClass('chkvisiabled')) {
                    _self.rowSetActionsEditing($row);
                } else if ($this.hasClass('readonly')) {
                    $this.html('<input readonly disabled type="text" class="form-control disabled readonly" value="' + data[i] + '"/>');         
                } else {
                    var class_name = "";
                    if(index == 3){
                        class_name = "colorpicker-rgba";
                    }
                    $this.html('<input type="text" class="form-control input-block '+class_name+'" value="' + data[i] + '"/>');
                    $('.colorpicker-rgba').colorpicker({
                        format: 'hex'
                    });
                }
            });
        },

        rowSave: function ($row) {
            var _self = this,
            $actions,
            values = [],
            $checked,
            $checkbox,
            $checkvi,
            $addNew;

            if ($row.hasClass('adding')) {
                this.$addButton.removeAttr('disabled');
                $row.removeClass('adding');
            }

            values = $row.find('td').map(function () {
                var $this = $(this);

                if ($this.hasClass('actions') || $this.hasClass('chkvisiabled')) {
                    _self.rowSetActionsDefault($row);
                    return _self.datatable.cell(this).data();
                } else if($this.hasClass('chkenabled')){
                    $checked = $this.children('div').children('input')[0].checked;
                    return _self.datatable.cell(this).data();
                }
                else {
                    return $.trim($this.find('input').val());
                }
            });
            //this.datatable.row($row.get(0)).data(values);

            $actions = $row.find('td.actions');
            if ($actions.get(0)) {
                this.rowSetActionsDefault($row);
            }

            $checkbox = $row.find('td.chkenabled');
            $checkvi = $row.find('td.chkvisiabled');
            if(!$checked)
            {
                $checkbox.children('div').children('input').removeAttr('checked');
                $checkvi.children('div').children('input').attr('checked',true);
            }
            else{
                $checkbox.children('div').children('input').attr('checked',true);
                $checkvi.children('div').children('input').removeAttr('checked');
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
                        url:  $row.data('id') ? '/admin/survey/save/' + $row.data('id') : '/admin/survey/add',
                        type: 'post',
                        dataType: 'json',
                        data: {id:$row.data('id'), qid: values[0],content: values[1], css_class:values[2],orderby: values[3],unit_type:$('.survey-check:checked').val(), units: JSON.stringify(result)},
                    })
                    .done(function (response) {
                        if(response.success){
                            if(typeof($row.data('id')) == "undefined")
                            {
                                $row.attr('data-id',response.id);
                            }
                            _self.datatable.row($row.get(0)).data(values);
                            swal("Success!", '', "success");
                            location.reload();
                        }else{
                            _self.rowSetActionsAdd($row);
                            swal("Error!", response.message, "error");    
                        }
                    })
                    .fail(function (response) {
                        swal("Error!", "Problem when processing request", "error");
                        location.reload();
                    });
                });    
            });

            //$.ajax({
            //    url:  $row.data('id') ? '/admin/survey/save/' + $row.data('id') : '/admin/survey/add',
            //    type: 'post',
            //    dataType: 'json',
            //    data: {content: values[1], id: values[0]},
            //})
            //    .done(function (response) {
            //        if(typeof($row.data('id')) == "undefined")
            //        {
            //            $row.attr('data-id',response.id);
            //        }
            //    })
            //    .fail(function () {
            //    })
            //    .always(function () {
            //    });

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
            $row.find('.checkbox').addClass('hidden');
        },

        rowSetActionsDefault: function ($row) {
            $row.find('.on-editing').addClass('hidden');
            $row.find('.on-default').removeClass('hidden');               
            $row.find('.checkbox').removeClass('hidden');
        },

        rowSetActionsAdd: function ($row) {
            $row.find('.on-editing').removeClass('hidden');
            $row.find('.on-default').addClass('hidden');               
            $row.find('.checkbox').addClass('hidden');
        }

    };

    $(function () {
        EditableTable.initialize();
    });

}).apply(this, [jQuery]);



$("input:checkbox").on('click', function() {
      // in the handler, 'this' refers to the box clicked on
      var $box = $(this);
      var group = "input:checkbox[name='" + $box.attr("name") + "']";
      var type = 0;
      var table = $box.parent().parent().parent().parent().parent();
      if ($box.is(":checked")) {
        // the name of the box is retrieved using the .attr() method
        // as it is assumed and expected to be immutable
        
        // the checked state of the group/box on the other hand will change
        // and the current value is retrieved using .prop() method
        $(group).prop("checked", false);
        $box.prop("checked", true);
    } else {
        $(group).prop("checked", true);
        $box.prop("checked", false);
    }
    var $check = false;
    if($box.attr('id') == 'en')
    {
        $check = $box.is(":checked");
    }
    else{
        $check = !$box.is(":checked");
    }


    if(table.hasClass('datatable-editable'))
    {
        $type = table.prop('id').slice(-1);
    }
    else{
        $type = 0;
    }
    swal({
            //title: "Are you sure you want to disable this question?",
            text: $check ? " Are you sure you want to enable this question? Enabling a question will add the question from the survey, but the data will remain in the survey data section of the dashboard." : " Are you sure you want to disable this question? Disabling a question will delete the question from the survey, but the data will remain in the survey data section of the dashboard.",            
            type: "info",
            showCancelButton: true,
            confirmButtonClass: 'btn-info',
            confirmButtonText: "OK",
            cancelButtonClass: 'btn-default'
            //closeOnConfirm: false
        }).catch(e => {}).then(function (isConfirm) {
            if(isConfirm) {
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
                    	url: (table.hasClass('datatable-editable') ? '/admin/survey/update_exit/' : '/admin/survey/update/') + $box.parent().parent().parent().data('id'),
                        type: 'post',
                        dataType: 'json',
                        data: {check: $check ? 1 : 0, unit_type:$('.survey-check:checked').val(), type: $type, unit_type:$('.survey-check:checked').val(),units: JSON.stringify(result), id: $box.parent().parent().parent().data('id')},
                    })
                    .done(function(response) {
                        if(response.success){
                          swal("Change!", response.message, "success"); 
                          location.reload(); 
                      }

                  })
                    .fail(function(){
                        swal("Error!", "Problem when processing request", "error");
                        location.reload();
                    })
                })
            } else{
                if($box.attr('id') == 'en')
                {
                    $(group).prop("checked", $check);
                    $box.prop("checked", !$check);
                }
                else
                {
                    $(group).prop("checked", !$check);
                    $box.prop("checked", $check);   
                }
            }
        });
    });
(function ($) {
    'use strict';
    var EditableTable = {
        options: {
            addButton: '#addToTable1',
            table: '#datatable-editable1',            
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
            this.datatable = this.$table.DataTable({'paging': false,});

            window.dt = this.datatable;

            return this;
        },

        events: function () {
            var _self = this;

            this.$table
            .on('click', 'a.save1', function (e) {
                e.preventDefault();

                _self.rowSave($(this).closest('tr'));
            })
            .on('click', 'a.cancel1', function (e) {
                e.preventDefault();

                _self.rowCancel($(this).closest('tr'));
            })
            .on('click', 'a.edit1', function (e) {
                e.preventDefault();

                _self.rowEdit($(this).closest('tr'));
            })
            .on('click', 'a.remove1', function (e) {
                e.preventDefault();

                var $row = $(this).closest('tr');

                $.magnificPopup.open({
                    items: {
                        src: _self.options.dialog.wrapper,
                        type: 'inline'
                    },
                    preloader: false,
                    modal: true,
                    callbacks: {
                        change: function () {
                            _self.dialog.$confirm.on('click', function (e) {
                                e.preventDefault();

                                _self.rowRemove($row);
                                $.magnificPopup.close();
                            });
                        },
                        close: function () {
                            _self.dialog.$confirm.off('click');
                        }
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
            $row,
            checkbox,
            id,
            checkvisiabled;

            actions = [
            '<a href="#" class="hidden on-editing save1"><i class="fa fa-save"></i></a>',
            '<a href="#" class="hidden on-editing cancel1"><i class="fa fa-times"></i></a>',
            '<a href="#" class="on-default edit1"><i class="fa fa-pencil"></i></a>',
            ].join(' ');
            id = Math.random().toString(36);
            checkbox = ['<div class="checkbox checkbox-success checkbox-circle"><input name="'+id+'" type="checkbox"><label></label></div>',
            ].join(' ');
            checkvisiabled = ['<div class="checkbox checkbox-danger checkbox-circle"><input name="'+id+'" type="checkbox"><label></label></div>',
            ].join(' ');
            
            data = this.datatable.row.add(['','','', checkbox, checkvisiabled, actions]);
            $row = this.datatable.row(data[0]).nodes().to$();

            $row
            .addClass('adding')
            .find('td:last')
            .addClass('actions');
            
            this.rowEdit($row);

            this.datatable.order([0, 'asc']).draw(); // always show fields
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
                ;
                if(index == 4 && !$this.hasClass('chkenabled'))
                    $this.addClass('chkenabled');
                else if(index == 5 && !$this.hasClass('chkvisiabled')){
                    $this.addClass('chkvisiabled');
                }
                else if(index == 1){
                    $this.addClass('readonly');
                }
                
                if ($this.hasClass('actions') || $this.hasClass('chkenabled') || $this.hasClass('chkvisiabled')) {
                    _self.rowSetActionsEditing($row);
                } else if ($this.hasClass('readonly')) {
                    $this.html('<input readonly disabled type="text" class="form-control disabled readonly" value="' + data[i] + '"/>');
                //} 
                //else if($this.hasClass('chkenabled')){
                //    if($this.children('div').children('input')[0].checked){
                //        $this.html('<div class="checkbox checkbox-success checkbox-circle"><input id="checkbox-10" type="checkbox" checked><label for="checkbox-10"></label></div>');                
                //    } else{
                //        $this.html('<div class="checkbox checkbox-success checkbox-circle"><input id="checkbox-10" type="checkbox"><label for="checkbox-10"></label></div>');                
                //    }          
            } else {
                $this.html('<input type="text" class="form-control input-block" style ="width:100%;" value="' + data[i] + '"/>');
            }
        });
        },

        rowSave: function ($row) {
            var _self = this,
            $actions,
            values = [],
            $checked,
            $checkbox,
            $checkvi,
            $addNew;

            if ($row.hasClass('adding')) {
                this.$addButton.removeAttr('disabled');
                $row.removeClass('adding');
            }

            values = $row.find('td').map(function () {
                var $this = $(this);

                if ($this.hasClass('actions') || $this.hasClass('chkvisiabled')) {
                    _self.rowSetActionsDefault($row);
                    return _self.datatable.cell(this).data();
                } else if($this.hasClass('chkenabled')){
                    $checked = $this.children('div').children('input')[0].checked;
                    return _self.datatable.cell(this).data();
                }
                else {
                    return $.trim($this.find('input').val());
                }
            });
            //this.datatable.row($row.get(0)).data(values);

            $actions = $row.find('td.actions');
            if ($actions.get(0)) {
                this.rowSetActionsDefault($row);
            }

            $checkbox = $row.find('td.chkenabled');
            $checkvi = $row.find('td.chkvisiabled');
            if(!$checked)
            {
                $checkbox.children('div').children('input').removeAttr('checked');
                $checkvi.children('div').children('input').attr('checked',true);
            }
            else{
                $checkbox.children('div').children('input').attr('checked',true);
                $checkvi.children('div').children('input').removeAttr('checked');
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
                        url:  $row.data('id') ? '/admin/survey/save_exit/' + $row.data('id') : '/admin/survey/add_exit',
                        type: 'post',
                        dataType: 'json',
                        data: {id:$row.data('id'), qid: values[0],content: values[1],orderby: values[2], unit_type:$('.survey-check:checked').val(), units: JSON.stringify(result), type: 1},
                    })
                    .done(function (response) {
                        if(response.success){
                            if(typeof($row.data('id')) == "undefined")
                            {
                                $row.attr('data-id',response.id);
                            }
                            _self.datatable.row($row.get(0)).data(values);
                            swal("Success!", '', "success");
                            location.reload();
                        }else{
                            _self.rowSetActionsAdd($row);
                            swal("Error!", response.message, "error");    
                        }

                            //if(typeof($row.data('id')) == "undefined")
                            //{
                            //    $row.attr('data-id',response.id);
                            //}
                            //swal("Success!", '', "success");
                            //location.reload();
                        })
                    .fail(function (response) {
                        swal("Error!", "Problem when processing request", "error");
                        location.reload();
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
            $row.find('.checkbox').addClass('hidden');
        },

        rowSetActionsDefault: function ($row) {
            $row.find('.on-editing').addClass('hidden');
            $row.find('.on-default').removeClass('hidden');               
            $row.find('.checkbox').removeClass('hidden');
        },

        rowSetActionsAdd: function ($row) {
            $row.find('.on-editing').removeClass('hidden');
            $row.find('.on-default').addClass('hidden');               
            $row.find('.checkbox').addClass('hidden');
        }

    };

    $(function () {
        EditableTable.initialize();
    });

}).apply(this, [jQuery]);

// Exit 2
(function ($) {
    'use strict';
    var EditableTable = {
        options: {
            addButton: '#addToTable2',
            table: '#datatable-editable2',            
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
           this.datatable = this.$table.DataTable({'paging': false,});

           window.dt = this.datatable;

           return this;
       },

       events: function () {
        var _self = this;

        this.$table
        .on('click', 'a.save2', function (e) {
            e.preventDefault();

            _self.rowSave($(this).closest('tr'));
        })
        .on('click', 'a.cancel2', function (e) {
            e.preventDefault();

            _self.rowCancel($(this).closest('tr'));
        })
        .on('click', 'a.edit2', function (e) {
            e.preventDefault();

            _self.rowEdit($(this).closest('tr'));
        })
        .on('click', 'a.remove2', function (e) {
            e.preventDefault();

            var $row = $(this).closest('tr');

            $.magnificPopup.open({
                items: {
                    src: _self.options.dialog.wrapper,
                    type: 'inline'
                },
                preloader: false,
                modal: true,
                callbacks: {
                    change: function () {
                        _self.dialog.$confirm.on('click', function (e) {
                            e.preventDefault();

                            _self.rowRemove($row);
                            $.magnificPopup.close();
                        });
                    },
                    close: function () {
                        _self.dialog.$confirm.off('click');
                    }
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
            $row,
            checkbox,
            id,
            checkvisiabled;

            actions = [
            '<a href="#" class="hidden on-editing save2"><i class="fa fa-save"></i></a>',
            '<a href="#" class="hidden on-editing cancel2"><i class="fa fa-times"></i></a>',
            '<a href="#" class="on-default edit2"><i class="fa fa-pencil"></i></a>',
            ].join(' ');
            id = Math.random().toString(36);
            checkbox = ['<div class="checkbox checkbox-success checkbox-circle"><input name="'+id+'" type="checkbox"><label></label></div>',
            ].join(' ');
            checkvisiabled = ['<div class="checkbox checkbox-danger checkbox-circle"><input name="'+id+'" type="checkbox"><label></label></div>',
            ].join(' ');
            
            data = this.datatable.row.add(['','','', checkbox, checkvisiabled, actions]);
            $row = this.datatable.row(data[0]).nodes().to$();

            $row
            .addClass('adding')
            .find('td:last')
            .addClass('actions');
            
            this.rowEdit($row);

            this.datatable.order([0, 'asc']).draw(); // always show fields
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
                ;
                if(index == 4 && !$this.hasClass('chkenabled'))
                    $this.addClass('chkenabled');
                else if(index == 5 && !$this.hasClass('chkvisiabled')){
                    $this.addClass('chkvisiabled');
                }
                else if(index == 1){
                    $this.addClass('readonly');
                }
                
                if ($this.hasClass('actions') || $this.hasClass('chkenabled') || $this.hasClass('chkvisiabled')) {
                    _self.rowSetActionsEditing($row);
                } else if ($this.hasClass('readonly')) {
                    $this.html('<input readonly disabled type="text" class="form-control disabled readonly" value="' + data[i] + '"/>');
                //} 
                //else if($this.hasClass('chkenabled')){
                //    if($this.children('div').children('input')[0].checked){
                //        $this.html('<div class="checkbox checkbox-success checkbox-circle"><input id="checkbox-10" type="checkbox" checked><label for="checkbox-10"></label></div>');                
                //    } else{
                //        $this.html('<div class="checkbox checkbox-success checkbox-circle"><input id="checkbox-10" type="checkbox"><label for="checkbox-10"></label></div>');                
                //    }          
            } else {
                $this.html('<input type="text" class="form-control input-block" style ="width:100%;" value="' + data[i] + '"/>');
            }
        });
        },

        rowSave: function ($row) {
            var _self = this,
            $actions,
            values = [],
            $checked,
            $checkbox,
            $checkvi,
            $addNew;

            if ($row.hasClass('adding')) {
                this.$addButton.removeAttr('disabled');
                $row.removeClass('adding');
            }

            values = $row.find('td').map(function () {
                var $this = $(this);

                if ($this.hasClass('actions') || $this.hasClass('chkvisiabled')) {
                    _self.rowSetActionsDefault($row);
                    return _self.datatable.cell(this).data();
                } else if($this.hasClass('chkenabled')){
                    $checked = $this.children('div').children('input')[0].checked;
                    return _self.datatable.cell(this).data();
                }
                else {
                    return $.trim($this.find('input').val());
                }
            });
            this.datatable.row($row.get(0)).data(values);

            $actions = $row.find('td.actions');
            if ($actions.get(0)) {
                this.rowSetActionsDefault($row);
            }

            $checkbox = $row.find('td.chkenabled');
            $checkvi = $row.find('td.chkvisiabled');
            if(!$checked)
            {
                $checkbox.children('div').children('input').removeAttr('checked');
                $checkvi.children('div').children('input').attr('checked',true);
            }
            else{
                $checkbox.children('div').children('input').attr('checked',true);
                $checkvi.children('div').children('input').removeAttr('checked');
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
                        url:  $row.data('id') ? '/admin/survey/save_exit/' + $row.data('id') : '/admin/survey/add_exit',
                        type: 'post',
                        dataType: 'json',
                        data: {id:$row.data('id'), qid: values[0],content: values[1],orderby: values[2],unit_type:$('.survey-check:checked').val(),units: JSON.stringify(result), type: 2},
                    })
                    .done(function (response) {
                        if(typeof($row.data('id')) == "undefined")
                        {
                            $row.attr('data-id',response.id);
                        }
                        swal("Success!", '', "success");
                        location.reload();
                    })
                    .fail(function (response) {
                        swal("Error!", "Problem when processing request", "error");
                        location.reload();
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
            $row.find('.checkbox').addClass('hidden');
        },

        rowSetActionsDefault: function ($row) {
            $row.find('.on-editing').addClass('hidden');
            $row.find('.on-default').removeClass('hidden');               
            $row.find('.checkbox').removeClass('hidden');
        }

    };

    $(function () {
        EditableTable.initialize();
    });

}).apply(this, [jQuery]);

// Exit 3
(function ($) {
    'use strict';
    var EditableTable = {
        options: {
            addButton: '#addToTable3',
            table: '#datatable-editable3',            
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
            this.datatable = this.$table.DataTable({'paging': false,});

            window.dt = this.datatable;

            return this;
        },

        events: function () {
            var _self = this;

            this.$table
            .on('click', 'a.save3', function (e) {
                e.preventDefault();

                _self.rowSave($(this).closest('tr'));
            })
            .on('click', 'a.cancel3', function (e) {
                e.preventDefault();

                _self.rowCancel($(this).closest('tr'));
            })
            .on('click', 'a.edit3', function (e) {
                e.preventDefault();

                _self.rowEdit($(this).closest('tr'));
            })
            .on('click', 'a.remove3', function (e) {
                e.preventDefault();

                var $row = $(this).closest('tr');

                $.magnificPopup.open({
                    items: {
                        src: _self.options.dialog.wrapper,
                        type: 'inline'
                    },
                    preloader: false,
                    modal: true,
                    callbacks: {
                        change: function () {
                            _self.dialog.$confirm.on('click', function (e) {
                                e.preventDefault();

                                _self.rowRemove($row);
                                $.magnificPopup.close();
                            });
                        },
                        close: function () {
                            _self.dialog.$confirm.off('click');
                        }
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
            $row,
            checkbox,
            id,
            checkvisiabled;

            actions = [
            '<a href="#" class="hidden on-editing save3"><i class="fa fa-save"></i></a>',
            '<a href="#" class="hidden on-editing cancel3"><i class="fa fa-times"></i></a>',
            '<a href="#" class="on-default edit3"><i class="fa fa-pencil"></i></a>',
            ].join(' ');
            id = Math.random().toString(36);
            checkbox = ['<div class="checkbox checkbox-success checkbox-circle"><input name="'+id+'" type="checkbox"><label></label></div>',
            ].join(' ');
            checkvisiabled = ['<div class="checkbox checkbox-danger checkbox-circle"><input name="'+id+'" type="checkbox"><label></label></div>',
            ].join(' ');
            
            data = this.datatable.row.add(['','','', checkbox, checkvisiabled, actions]);
            $row = this.datatable.row(data[0]).nodes().to$();

            $row
            .addClass('adding')
            .find('td:last')
            .addClass('actions');
            
            this.rowEdit($row);

            this.datatable.order([0, 'asc']).draw(); // always show fields
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
                ;
                if(index == 4 && !$this.hasClass('chkenabled'))
                    $this.addClass('chkenabled');
                else if(index == 5 && !$this.hasClass('chkvisiabled')){
                    $this.addClass('chkvisiabled');
                }
                else if(index == 1){
                    $this.addClass('readonly');
                }
                
                if ($this.hasClass('actions') || $this.hasClass('chkenabled') || $this.hasClass('chkvisiabled')) {
                    _self.rowSetActionsEditing($row);
                } else if ($this.hasClass('readonly')) {
                    $this.html('<input readonly disabled type="text" class="form-control disabled readonly" value="' + data[i] + '"/>');
                //} 
                //else if($this.hasClass('chkenabled')){
                //    if($this.children('div').children('input')[0].checked){
                //        $this.html('<div class="checkbox checkbox-success checkbox-circle"><input id="checkbox-10" type="checkbox" checked><label for="checkbox-10"></label></div>');                
                //    } else{
                //        $this.html('<div class="checkbox checkbox-success checkbox-circle"><input id="checkbox-10" type="checkbox"><label for="checkbox-10"></label></div>');                
                //    }          
            } else {
                $this.html('<input type="text" class="form-control input-block" style ="width:100%;" value="' + data[i] + '"/>');
            }
        });
        },

        rowSave: function ($row) {
            var _self = this,
            $actions,
            values = [],
            $checked,
            $checkbox,
            $checkvi,
            $addNew;

            if ($row.hasClass('adding')) {
                this.$addButton.removeAttr('disabled');
                $row.removeClass('adding');
            }

            values = $row.find('td').map(function () {
                var $this = $(this);

                if ($this.hasClass('actions') || $this.hasClass('chkvisiabled')) {
                    _self.rowSetActionsDefault($row);
                    return _self.datatable.cell(this).data();
                } else if($this.hasClass('chkenabled')){
                    $checked = $this.children('div').children('input')[0].checked;
                    return _self.datatable.cell(this).data();
                }
                else {
                    return $.trim($this.find('input').val());
                }
            });
            this.datatable.row($row.get(0)).data(values);

            $actions = $row.find('td.actions');
            if ($actions.get(0)) {
                this.rowSetActionsDefault($row);
            }

            $checkbox = $row.find('td.chkenabled');
            $checkvi = $row.find('td.chkvisiabled');
            if(!$checked)
            {
                $checkbox.children('div').children('input').removeAttr('checked');
                $checkvi.children('div').children('input').attr('checked',true);
            }
            else{
                $checkbox.children('div').children('input').attr('checked',true);
                $checkvi.children('div').children('input').removeAttr('checked');
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
                        url:  $row.data('id') ? '/admin/survey/save_exit/' + $row.data('id') : '/admin/survey/add_exit',
                        type: 'post',
                        dataType: 'json',
                        data: {id:$row.data('id'), qid: values[0],content: values[1],orderby: values[2],unit_type:$('.survey-check:checked').val(),units: JSON.stringify(result), type: 3},
                    })
                    .done(function (response) {
                        if(typeof($row.data('id')) == "undefined")
                        {
                            $row.attr('data-id',response.id);
                        }
                        swal("Success!", '', "success");
                        location.reload();
                    })
                    .fail(function (response) {
                        swal("Error!", "Problem when processing request", "error");
                        location.reload();
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
            $row.find('.checkbox').addClass('hidden');
        },

        rowSetActionsDefault: function ($row) {
            $row.find('.on-editing').addClass('hidden');
            $row.find('.on-default').removeClass('hidden');               
            $row.find('.checkbox').removeClass('hidden');
        }

    };

    $(function () {
        EditableTable.initialize();
    });

}).apply(this, [jQuery]);

// Exit 4
(function ($) {
    'use strict';
    var EditableTable = {
        options: {
            addButton: '#addToTable4',
            table: '#datatable-editable4',            
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
            this.datatable = this.$table.DataTable({'paging': false,});

            window.dt = this.datatable;

            return this;
        },

        events: function () {
            var _self = this;

            this.$table
            .on('click', 'a.save4', function (e) {
                e.preventDefault();

                _self.rowSave($(this).closest('tr'));
            })
            .on('click', 'a.cancel4', function (e) {
                e.preventDefault();

                _self.rowCancel($(this).closest('tr'));
            })
            .on('click', 'a.edit4', function (e) {
                e.preventDefault();

                _self.rowEdit($(this).closest('tr'));
            })
            .on('click', 'a.remove4', function (e) {
                e.preventDefault();

                var $row = $(this).closest('tr');

                $.magnificPopup.open({
                    items: {
                        src: _self.options.dialog.wrapper,
                        type: 'inline'
                    },
                    preloader: false,
                    modal: true,
                    callbacks: {
                        change: function () {
                            _self.dialog.$confirm.on('click', function (e) {
                                e.preventDefault();

                                _self.rowRemove($row);
                                $.magnificPopup.close();
                            });
                        },
                        close: function () {
                            _self.dialog.$confirm.off('click');
                        }
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
            $row,
            checkbox,
            id,
            checkvisiabled;

            actions = [
            '<a href="#" class="hidden on-editing save4"><i class="fa fa-save"></i></a>',
            '<a href="#" class="hidden on-editing cancel4"><i class="fa fa-times"></i></a>',
            '<a href="#" class="on-default edit4"><i class="fa fa-pencil"></i></a>',
            ].join(' ');
            id = Math.random().toString(36);
            checkbox = ['<div class="checkbox checkbox-success checkbox-circle"><input name="'+id+'" type="checkbox"><label></label></div>',
            ].join(' ');
            checkvisiabled = ['<div class="checkbox checkbox-danger checkbox-circle"><input name="'+id+'" type="checkbox"><label></label></div>',
            ].join(' ');
            
            data = this.datatable.row.add(['','','', checkbox, checkvisiabled, actions]);
            $row = this.datatable.row(data[0]).nodes().to$();

            $row
            .addClass('adding')
            .find('td:last')
            .addClass('actions');
            
            this.rowEdit($row);

            this.datatable.order([0, 'asc']).draw(); // always show fields
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
                ;
                if(index == 4 && !$this.hasClass('chkenabled'))
                    $this.addClass('chkenabled');
                else if(index == 5 && !$this.hasClass('chkvisiabled')){
                    $this.addClass('chkvisiabled');
                }
                else if(index == 1){
                    $this.addClass('readonly');
                }
                
                if ($this.hasClass('actions') || $this.hasClass('chkenabled') || $this.hasClass('chkvisiabled')) {
                    _self.rowSetActionsEditing($row);
                } else if ($this.hasClass('readonly')) {
                    $this.html('<input readonly disabled type="text" class="form-control disabled readonly" value="' + data[i] + '"/>');                
                } else {
                    $this.html('<input type="text" class="form-control input-block" style ="width:100%;" value="' + data[i] + '"/>');
                }
            });
        },

        rowSave: function ($row) {
            var _self = this,
            $actions,
            values = [],
            $checked,
            $checkbox,
            $checkvi,
            $addNew;

            if ($row.hasClass('adding')) {
                this.$addButton.removeAttr('disabled');
                $row.removeClass('adding');
            }

            values = $row.find('td').map(function () {
                var $this = $(this);

                if ($this.hasClass('actions') || $this.hasClass('chkvisiabled')) {
                    _self.rowSetActionsDefault($row);
                    return _self.datatable.cell(this).data();
                } else if($this.hasClass('chkenabled')){
                    $checked = $this.children('div').children('input')[0].checked;
                    return _self.datatable.cell(this).data();
                }
                else {
                    return $.trim($this.find('input').val());
                }
            });
            this.datatable.row($row.get(0)).data(values);

            $actions = $row.find('td.actions');
            if ($actions.get(0)) {
                this.rowSetActionsDefault($row);
            }

            $checkbox = $row.find('td.chkenabled');
            $checkvi = $row.find('td.chkvisiabled');
            if(!$checked)
            {
                $checkbox.children('div').children('input').removeAttr('checked');
                $checkvi.children('div').children('input').attr('checked',true);
            }
            else{
                $checkbox.children('div').children('input').attr('checked',true);
                $checkvi.children('div').children('input').removeAttr('checked');
            }
            $addNew = !$row.data('id');
            this.datatable.draw();

            swal({
                title: "Are you sure you want to update?",
                text: "You will not be able to recover this!2",
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
                        url:  $row.data('id') ? '/admin/survey/save_exit/' + $row.data('id') : '/admin/survey/add_exit',
                        type: 'post',
                        dataType: 'json',
                        data: {id:$row.data('id'), qid: values[0],content: values[1],orderby: values[2],unit_type:$('.survey-check:checked').val(),units: JSON.stringify(result), type: 4},
                    })
                    .done(function (response) {
                        if(typeof($row.data('id')) == "undefined")
                        {
                            $row.attr('data-id',response.id);
                        }
                        swal("Success!", '', "success");
                        location.reload();
                    })
                    .fail(function (response) {
                        swal("Error!", "Problem when processing request", "error");
                        location.reload();
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
            $row.find('.checkbox').addClass('hidden');
        },

        rowSetActionsDefault: function ($row) {
            $row.find('.on-editing').addClass('hidden');
            $row.find('.on-default').removeClass('hidden');               
            $row.find('.checkbox').removeClass('hidden');
        }

    };

    $(function () {
        EditableTable.initialize();
    });

}).apply(this, [jQuery]);