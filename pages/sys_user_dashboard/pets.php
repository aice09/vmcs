<br>
<ol class="breadcrumb">
  <li><a href="index.php?page=dashboard">Home</a></li>
  <li>Pets</li>
  <li>Dogs</li>
</ol>

<h1>Dogs</h1>

<button type="button" class="btn btn-success create-new">Add New Ticket</button><br><br>
<table class="table table-bordered responsive nowrap" id="example" width="100%">
	<thead> 
		<tr>
			<th width="3%">No</th>
			<th width="30%">Pet Code</th>
			<th width="15%">Name</th>
			<th width="6%">Category</th>
			<th width="6%">Created by</th>
			<th width="6%">Created Date</th>
			<th width="15%">Updated by</th>
			<th width="6%">Updated Date</th>
			<th width="6%">Status</th>
			<th></th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<th width="3%">No</th>
			<th width="30%">Pet Code</th>
			<th width="15%">Name</th>
			<th width="6%">Category</th>
			<th width="6%">Created by</th>
			<th width="6%">Created Date</th>
			<th width="15%">Updated by</th>
			<th width="6%">Updated Date</th>
			<th width="6%">Status</th>
			<th></th>
		</tr>
	</tfoot>
</table>

<script type="text/javascript">
$(document).ready(function() {
    //Reading
    var dataTable = $('#example').DataTable({
        "processing": true,
        "serverSide": true,
        "ajax": {
            url: "pages_exe/sys_user_dashboard/pets_exe_dt.php",
            type: "POST"
        }
    });
});

</script>