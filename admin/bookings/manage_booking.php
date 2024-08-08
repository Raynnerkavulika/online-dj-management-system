<?php 
require_once('./../../config.php');
if(isset($_GET['id'])){
    $qry = $conn->query("SELECT * from `booking_list` where id in ({$_GET['id']}) ");
    if($qry->num_rows > 0){
        $res = $qry->fetch_array();
        foreach($res as $k => $v){
            if(!is_numeric($k))
            $$k = $v;
        }
    }
}
?>


<div class="container-fluid">
    <form action="" id="book-form">
        <input type="hidden" name="id" value="<?= isset($id) ? $id :'' ?>">
        <div class="row">
            <div class="col-md-6 form-group">
                <label for="client_name" class="control-label">Full Name</label>
                <input type="text" id="client_name" name="client_name" class="form-control form-control-sm form-control-border" value="<?= isset($client_name) ? $client_name : "" ?>" required>
            </div>
            <div class="col-md-6 form-group">
                <label for="client_contact" class="control-label">Contact</label>
                <input type="text" id="client_contact" name="client_contact" class="form-control form-control-sm form-control-border" value="<?= isset($client_contact) ? $client_contact : "" ?>" required>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 form-group">
                <label for="client_address" class="control-label">Address</label>
                <textarea name="client_address" id="client_address" class="form-control form-control-sm rounded-0" rows="3" required><?= isset($client_address) ? $client_address : "" ?></textarea>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 form-group">
                <label for="package_id" class="control-label">Package</label>
                <select name="package_id" id="package_id" class="form-control form-control-sm form-control-border select2" required>
                    <option value="" disabled="disabled" <?= !isset($package_id) ? "selected" : "" ?>></option>
                    <?php 
                    $package = $conn->query("SELECT * FROM `package_list` where delete_flag = 0 and status = 1 order by `name` asc");
                    while($row= $package->fetch_assoc()):
                    ?>
                        <option value="<?= $row['id'] ?>" <?= isset($package_id) && $package_id == $row['id'] ? 'selected' : "" ?>><?= $row['name'] ?></option>
                    <?php endwhile; ?>
                </select>
            </div>
            <div class="col-md-6 form-group">
                <label for="event_id" class="control-label">Event Type</label>
                <select name="event_id" id="event_id" class="form-control form-control-sm form-control-border select2" required>
                    <option value="" disabled="disabled" <?= !isset($event_id) ? $event_id : "" ?>></option>
                    <?php 
                    $event = $conn->query("SELECT * FROM `event_list` where delete_flag = 0 and status = 1 order by `name` asc");
                    while($row= $event->fetch_assoc()):
                    ?>
                        <option value="<?= $row['id'] ?>" <?= isset($event_id) && $event_id == $row['id'] ? 'selected' : '' ?>><?= $row['name'] ?></option>
                    <?php endwhile; ?>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 form-group">
                <label for="event_venue" class="control-label">Event Venue</label>
                <input type="text" id="event_venue" name="event_venue" class="form-control form-control-sm form-control-border" value="<?= isset($event_venue) ? $event_venue : "" ?>" required>
            </div>
            <div class="col-md-6 form-group">
                <label for="event_schedule" class="control-label">Event Schedule</label>
                <input type="datetime-local" id="event_schedule" name="event_schedule" class="form-control form-control-sm form-control-border" value="<?= isset($event_schedule) ? date("Y-m-d\TH:i", strtotime($event_schedule)) : "" ?>" required>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 form-group">
                <label for="remarks" class="control-label">Other Information</label>
                <textarea name="remarks" id="remarks" class="form-control form-control-sm rounded-0" rows="3" required><?= isset($remarks) ? $remarks : "" ?></textarea>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 form-group">
                <label for="status" class="control-label">Status</label>
                <select id="status" name="status" class="form-control form-control-sm form-control-border" required>
                    <option value="0" <?= isset($status) && $status == 0 ? 'selected' : '' ?>>Pending</option>
                    <option value="1" <?= isset($status) && $status == 1 ? 'selected' : '' ?>>Confirmed</option>
                    <option value="2" <?= isset($status) && $status == 2 ? 'selected' : '' ?>>Done</option>
                    <option value="3" <?= isset($status) && $status == 3 ? 'selected' : '' ?>>Cancelled</option>
                </select>
            </div>
        </div>
    </form>
</div>
<script>
    $(function(){
        $('#uni_modal').on('shown.bs.modal',function(){
            $('.select2').select2({
                placeholder:"Please select here",
                width:"100%",
                dropdownParent:$('#uni_modal')
            })
        })
        $('#uni_modal #book-form').submit(function(e){
            e.preventDefault();
            var _this = $(this)
            $('.pop-msg').remove()
            var el = $('<div>')
                el.addClass("pop-msg alert")
                el.hide()
            start_loader();
            $.ajax({
                url:_base_url_+"classes/Master.php?f=save_book",
				data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                dataType: 'json',
				error:err=>{
					console.log(err)
					alert_toast("An error occured",'error');
					end_loader();
				},
                success:function(resp){
                    if(resp.status == 'success'){
                        location.reload();
                    }else if(!!resp.msg){
                        el.addClass("alert-danger")
                        el.text(resp.msg)
                        _this.prepend(el)
                    }else{
                        el.addClass("alert-danger")
                        el.text("An error occurred due to unknown reason.")
                        _this.prepend(el)
                    }
                    el.show('slow')
                    $('html,body,.modal').animate({scrollTop:0},'fast')
                    end_loader();
                }
            })
        })
    })
</script>