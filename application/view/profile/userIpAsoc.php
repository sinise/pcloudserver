<div class="container">

    <!-- echo out the system feedback (error and success messages) -->
    <?php $this->renderFeedbackMessages(); ?>
    <?php if (Session::get('user_account_type') == 3) { ?>

    <div class="login-box" style="width: 50%; display: block;">
        <h2>Register a new ip to this user</h2>

        <?php if ($this-user) { ?>
            <!-- register form -->
            <form method="post" action="<?php echo Config::get('URL'); ?>profile/userIpAsoc_action">
            <input type="text" name="ip" pattern="[a-zA-Z0-9]{7,15}" required placeholder="public ip" autocomplete="off" />
            <input type="text" readonly name="user_id" placeholder='<?php $this->user->user_id ?>' />
            <p style="display: block; font-size: 11px; color: #999;">
            <br>
            </p>

            <input type="submit" value="userIpAsoc" />
        </form>
    </div>
                <?php } ?>

</div>
