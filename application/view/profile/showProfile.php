<div class="container">
    <h1>ProfileController/showProfile/:id</h1>
    <div class="box">

        <!-- echo out the system feedback (error and success messages) -->
        <?php $this->renderFeedbackMessages(); ?>

        <h3>What happens here ?</h3>
        <div>This controller/action/view shows all public information about a certain user.</div>

        <?php if ($this->user) { ?>
            <div>
                <table class="overview-table">
                    <thead>
                    <tr>
                        <td>Id</td>
                        <td>Username</td>
                        <td>User's email</td>
                        <td>Activated ?</td>
                    </tr>
                    </thead>
                    <tbody>
                        <tr class="<?= ($this->user->user_active == 0 ? 'inactive' : 'active'); ?>">
<td><a href="<?= Config::get('URL') . 'profile/userIpAsoc/' . $this->user->user_id; ?>"><?= $this->user->user_id?></a></td>

                            <td><?= $this->user->user_name; ?></td>
                            <td><?= $this->user->user_email; ?></td>
                            <td><?= ($this->user->user_active == 0 ? 'No' : 'Yes'); ?></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        <?php } ?>

    </div>
</div>
