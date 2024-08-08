<style>
    #banner-img{
        width:100%;
        height:40vh;
        object-fit:cover;
        object-position:center center;
    }
</style>
<h1>Welcome to <?php echo $_settings->info('name') ?> - Admin Panel</h1>
<hr class="border-info">
<div class="row">
    <div class="col-12 col-sm-12 col-md-6 col-lg-3">
        <div class="info-box bg-gradient-dark shadow">
            <span class="info-box-icon bg-gradient-warning elevation-1"><i class="fas fa-th-list"></i></span>

            <div class="info-box-content">
            <span class="info-box-text">Total Events</span>
            <span class="info-box-number text-right">
                <?php 
                    echo $conn->query("SELECT * FROM `event_list` where delete_flag = 0 ")->num_rows;
                ?>
            </span>
            </div>
            <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
    </div>
    <div class="col-12 col-sm-12 col-md-6 col-lg-3">
        <div class="info-box bg-gradient-dark shadow">
            <span class="info-box-icon bg-gradient-info elevation-1"><i class="fas fa-table"></i></span>

            <div class="info-box-content">
            <span class="info-box-text">Daily Packages</span>
            <span class="info-box-number text-right">
                <?php 
                    echo $conn->query("SELECT * FROM `package_list` where delete_flag=0 ")->num_rows;
                ?>
            </span>
            </div>
            <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
    </div>
    <div class="col-12 col-sm-12 col-md-6 col-lg-3">
        <div class="info-box bg-gradient-dark shadow">
            <span class="info-box-icon bg-gradient-primary elevation-1"><i class="fas fa-clipboard-list"></i></span>

            <div class="info-box-content">
            <span class="info-box-text">Bookings</span>
            <span class="info-box-number text-right">
                <?php 
                    echo $conn->query("SELECT * FROM `booking_list` ")->num_rows;
                ?>
            </span>
            </div>
            <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
    </div>
    <div class="col-12 col-sm-12 col-md-6 col-lg-3">
        <div class="info-box bg-gradient-dark shadow">
            <span class="info-box-icon bg-gradient-teal elevation-1"><i class="fas fa-question-circle"></i></span>

            <div class="info-box-content">
            <span class="info-box-text">Unread Inquiries</span>
            <span class="info-box-number text-right">
                <?php 
                    echo $conn->query("SELECT * FROM `message_list` where  status = 0 ")->num_rows;
                ?>
            </span>
            </div>
            <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
    </div>
</div>
<hr>
<div class="row">
    <div class="col-md-12">
        <img src="<?= validate_image($_settings->info('cover')) ?>" alt="Website Page" id="banner-img" class="w-100">
    </div>
</div>
