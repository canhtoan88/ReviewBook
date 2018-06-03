<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
	<title>Fresh Bootstrap Table by Creative Tim</title>

	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link href="assets/css/fresh-bootstrap-table.css" rel="stylesheet" />
     
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        
</head>
<body>
<div class="wrapper">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                                
                <div class="fresh-table full-color-orange">
                <!--    Available colors for the full background: full-color-blue, full-color-azure, full-color-green, full-color-red, full-color-orange                  
                        Available colors only for the toolbar: toolbar-color-blue, toolbar-color-azure, toolbar-color-green, toolbar-color-red, toolbar-color-orange
                -->
                
                    <div class="toolbar">
                        <button id="alertBtn" class="btn btn-default">Alert</button>
                    </div>
                    
                    <table id="fresh-table" class="table">
                        <thead>
                            <th data-field="id" data-sortable="true">ID</th>
                        	<th data-field="name" data-sortable="true">Name</th>
                        	<th data-field="salary" data-sortable="true">Salary</th>
                        	<th data-field="country" data-sortable="true">Country</th>
                        	<th data-field="city">City</th>
                        	<th data-field="actions" data-formatter="operateFormatter" data-events="operateEvents">Actions</th>
                        </thead>
                        <tbody>
                            <tr>
                            	<td>1</td>
                            	<td>Dakota Rice</td>
                            	<td>$36,738</td>
                            	<td>Niger</td>
                            	<td>Oud-Turnhout</td>
                            	<td></td>
                            </tr>
                            <tr>
                            	<td>2</td>
                            	<td>Minerva Hooper</td>
                            	<td>$23,789</td>
                            	<td>Cura�ao</td>
                            	<td>Sinaai-Waas</td>
                            	<td></td>
                            </tr>
                            <tr>
                            	<td>3</td>
                            	<td>Sage Rodriguez</td>
                            	<td>$56,142</td>
                            	<td>Netherlands</td>
                            	<td>Baileux</td>
                            	<td></td>
                            </tr>
                            <tr>
                            	<td>4</td>
                            	<td>Philip Chaney</td>
                            	<td>$38,735</td>
                            	<td>Korea, South</td>
                            	<td>Overland Park</td>
                            	<td></td>
                            </tr>
                            <tr>
                            	<td>5</td>
                            	<td>Doris Greene</td>
                            	<td>$63,542</td>
                            	<td>Malawi</td>
                            	<td>Feldkirchen in K�rnten</td>
                            	<td></td>
                            </tr>
                            <tr>
                            	<td>6</td>
                            	<td>Mason Porter</td>
                            	<td>$78,615</td>
                            	<td>Chile</td>
                            	<td>Gloucester</td>
                            	<td></td>
                            </tr>
                            <tr>
                            	<td>7</td>
                            	<td>Alden Chen</td>
                            	<td>$63,929</td>
                            	<td>Finland</td>
                            	<td>Gary</td>
                            	<td></td>
                            </tr>
                            <tr>
                            	<td>8</td>
                            	<td>Colton Hodges</td>
                            	<td>$93,961</td>
                            	<td>Nicaragua</td>
                            	<td>Delft</td>
                            	<td></td>
                            </tr>
                            <tr>
                            	<td>9</td>
                            	<td>Illana Nelson</td>
                            	<td>$56,142</td>
                            	<td>Heard Island</td>
                            	<td>Montone</td>
                            	<td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                
                
            </div>
        </div>
    </div>
</div>

</body>
    <script src="assets/js/jquery-3.3.1.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/js/bootstrap-table.js"></script>

    <script type="text/javascript">
        var $table = $('#fresh-table'),
            $alertBtn = $('#alertBtn'),
            full_screen = false;
            
        $().ready(function(){
            $table.bootstrapTable({
                toolbar: ".toolbar",
    
                showRefresh: true,
                search: true,
                showToggle: true,
                showColumns: true,
                pagination: true,
                striped: true,
                pageSize: 8,
                pageList: [8,10,25,50,100],
                
                formatShowingRows: function(pageFrom, pageTo, totalRows){
                    //do nothing here, we don't want to show the text "showing x of y from..." 
                },
                formatRecordsPerPage: function(pageNumber){
                    return pageNumber + " rows visible";
                },
                icons: {
                    refresh: 'fa fa-refresh',
                    toggle: 'fa fa-th-list',
                    columns: 'fa fa-columns',
                    detailOpen: 'fa fa-plus-circle',
                    detailClose: 'fa fa-minus-circle'
                }
            });
            
                        
            
            $(window).resize(function () {
                $table.bootstrapTable('resetView');
            });
    
            
            window.operateEvents = {
                'click .like': function (e, value, row, index) {
                    alert('You click like icon, row: ' + JSON.stringify(row));
                    console.log(value, row, index);
                },
                'click .edit': function (e, value, row, index) {
                    alert('You click edit icon, row: ' + JSON.stringify(row));
                    console.log(value, row, index);    
                },
                'click .remove': function (e, value, row, index) {
                    $table.bootstrapTable('remove', {
                        field: 'id',
                        values: [row.id]
                    });
            
                }
            };
            
            $alertBtn.click(function () {
                alert("You pressed on Alert");
            });
            
        });
            
    
        function operateFormatter(value, row, index) {
            return [
                '<a rel="tooltip" title="Like" class="table-action like" href="javascript:void(0)" title="Like">',
                    '<i class="fa fa-heart"></i>',
                '</a>',
                '<a rel="tooltip" title="Edit" class="table-action edit" href="javascript:void(0)" title="Edit">',
                    '<i class="fa fa-edit"></i>',
                '</a>',
                '<a rel="tooltip" title="Remove" class="table-action remove" href="javascript:void(0)" title="Remove">',
                    '<i class="fa fa-remove"></i>',
                '</a>'
            ].join('');
        }
    
            
    </script>
</html>