<?php require_once('./../../config.php');?>
<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">List of Bookings</h3>
		<div class="card-tools">
			<button class="btn btn-flat btn-sm btn-primary" id="create_new"><i class="fa fa-plus"></i> Add New Booking</button>
		</div>
	</div>
	<div class="card-body">
		<div class="container-fluid">
        <div class="container-fluid">
			<table class="table table-hover table-striped table-bordered">
				<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>#</th>
						<th>Ref. Code</th>
						<th>Schedule</th>
						<th>Event</th>
						<th>Client</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php 
						$i = 1;
						$qry = $conn->query("SELECT b.*,e.name as `event` from `booking_list` b inner join `event_list` e on b.event_id = e.id order by b.status asc, unix_timestamp(b.`date_created`) desc ");
						while($row = $qry->fetch_assoc()):
					?>
						<tr>
							<td class="text-center"><?= $i++; ?></td>
							<td><?php echo ($row['code']) ?></td>
							<td class=""><?php echo date("Y-m-d H:i",strtotime($row['event_schedule'])) ?></td>
							<td class=""><?= $row['event'] ?></td>
							<td class=""><?= $row['client_name'] ?></td>
							<td class="text-center">
								<?php 
									switch ($row['status']){
										case 0:
											echo '<span class="rounded-pill badge badge-secondary bg-gradient-secondary px-3">Pending</span>';
											break;
										case 1:
											echo '<span class="rounded-pill badge badge-primary bg-gradient-primary px-3">Confirmed</span>';
											break;
										case 2:
											echo '<span class="rounded-pill badge badge-success bg-gradient-success px-3">Done</span>';
											break;
										case 3:
											echo '<span class="rounded-pill badge badge-danger bg-gradient-danger px-3">Cancelled</span>';
											break;
										default:
											echo '<span class="rounded-pill badge badge-default bg-gradient-default border px-3">N/A</span>';
											break;
									}
								?>
							</td>
							<td align="center">
								 <button type="button" class="btn btn-flat btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
				                  		Action
				                    <span class="sr-only">Toggle Dropdown</span>
				                  </button>
				                  <div class="dropdown-menu" role="menu">
				                    <a class="dropdown-item view_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-window-restore text-gray"></span> View</a>
									<?php if($row['status'] != 2): ?>
									<div class="dropdown-divider"></div>
				                    <a class="dropdown-item delete_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-trash text-danger"></span> Delete</a>
									<?php endif; ?>
				                  </div>
							</td>
						</tr>
					<?php endwhile; ?>
				</tbody>
			</table>
		</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('#create_new').click(function(){
			uni_modal("Add New Booking","bookings/manage_booking.php",'mid-large')
		})
		$('.view_data').click(function(){
			uni_modal("Booking Details","bookings/view_details.php?id="+$(this).attr('data-id'),"mid-large")
		})
		$('.delete_data').click(function(){
			_conf("Are you sure to delete this book permanently?","delete_book",[$(this).attr('data-id')])
		})
		$('.table td,.table th').addClass('py-1 px-2 align-middle')
		$('.table').dataTable({
            columnDefs: [
                { orderable: false, targets: 5 }
            ],
        });
	})
	function delete_book($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=delete_book",
			method:"POST",
			data:{id: $id},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("An error occured.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("An error occured.",'error');
					end_loader();
				}
			}
		})
	}
</script>