<div class="container">

    <!-- echo out the system feedback (error and success messages) -->
    <?php $this->renderFeedbackMessages(); ?>
    <?php if (Session::get('user_account_type') == 3) { ?>

    <div class="login-box" style="width: 50%; display: block;">
        <h2>Register a new ip to this user</h2>

            <!-- register form -->
            <form method="post" action="<?php echo Config::get('URL'); ?>profile/userIpAsoc_action">
            <input type="text" name="ip" required placeholder="public ip" autocomplete="off" />
            <input type="text" readonly name="user_id" placeholder='<?= $this->user->user_id ?>' />
            <br>
            <input type="submit" value="Submit"/>
        </form>
    </div>
   <?php } ?>

</div>


