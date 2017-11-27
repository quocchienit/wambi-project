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
                	_self.rowRemove($row);                    
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
            
            var actions,
                data,
                $row,input1, input2, input3;
            count++;
            $('#count_members').val(count);            
            actions = [                
                '<a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>',
            ].join(' ');
            
            data = this.datatable.row.add(['','','', actions]);
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
            
            var index = 0;
            $row.children('td').each(function (i) {
                var $this = $(this);
                var input1, input2,combocarrier, input3;
                index++;
                input1 = ['<input onkeyup = "addrequired(this)" required id = "fullname' + count + '"  name ="fullname'+ count +'" required type="text" class="form-control input-block" value=""/>',].join(' ');
	            input2 = ['<input onkeyup = "addrequired(this)"  id = "numberphone' + count + '" name ="numberphone' + count + '" type="text" class="form-control input-block" value=""/>',].join(' ');
                input3 = ['<input onkeyup = "addrequired(this)"  id = "email' + count + '" name ="email' + count + '" data-parsley-type="email" type="text" class="form-control input-block" value=""/>',].join(' ');
	            combocarrier = str_carrier.replace('fcarrier','fcarrier'+count);
                if ($this.hasClass('actions')) {
                    _self.rowSetActionsEditing($row);
                } else if ($this.hasClass('readonly')) {
                    $this.html('<input readonly disabled type="text" class="form-control disabled readonly" value="' + data[i] + '"/>');
                //} else if(index == 3){
                //	$this.html(combocarrier);
                }else if(index == 1){
                	$this.html(input1);
                }else if(index == 2){
                	$this.html(input2);
                }else if(index == 3){
                    $this.html(input3);
                }
                else {
                    $this.html('<input type="text" class="form-control input-block" value="' + data[i] + '"/>');
                }
            });
        },

        rowSave: function ($row) {
            var _self = this,
                $actions,
                values = [];

            if ($row.hasClass('adding')) {
                this.$addButton.removeAttr('disabled');
                $row.removeClass('adding');
            }

            //values = $row.find('td').map(function () {
            //    var $this = $(this);
            //    if ($this.hasClass('actions')) {
            //        _self.rowSetActionsDefault($row);
            //        return _self.datatable.cell(this).data();
            //    } if($this.children().is("select")){
            //    	return $("#fcarrier").val();
            //    }
            //    else {
            //        return $.trim($this.find('input').val());
            //    }
            //});
            //this.datatable.row($row.get(0)).data(values);

            $actions = $row.find('td.actions');
            if ($actions.get(0)) {
                this.rowSetActionsDefault($row);
            }
            this.datatable.draw();           
        },

        rowRemove: function ($row) {
            if ($row.hasClass('adding')) {
                this.$addButton.removeAttr('disabled');
            }
            count--;
            $('#count_members').val(count);
            this.datatable.row($row.get(0)).remove().draw();
        },

        rowSetActionsEditing: function ($row) {
        },

        rowSetActionsDefault: function ($row) {
        }

    };

    $(function () {
        EditableTable.initialize();
    });

}).apply(this, [jQuery]);

function addrequired(e){
    if(e.name.includes('numberphone')){
        var number = e.name.replace('numberphone','');
        if(e.value == ""){
            e.setAttribute('required',true)
        }else{
            $('#email'+number).attr('required',false);            
            $('#fullname'+number).attr('required',false);            
        }
    }else if(e.name.includes('email')){
        var number = e.name.replace('email','');
        if(e.value == ""){
            e.setAttribute('required',true)
        }else{
            $('#numberphone'+number).attr('required',false);
            $('#fullname'+number).attr('required',false);
        }
    }else{
        var number = e.name.replace('fullname','');
        if(e.value == ""){
            e.setAttribute('required',true)
        }else{
            $('#numberphone'+number).attr('required',false);
            $('#email'+number).attr('required',false);
        }
    }
}