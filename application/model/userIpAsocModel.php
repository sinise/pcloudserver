<?php

/**
 * Class userIpAsocModel
 *
 * Everything registration-related happens here.
 */
class userIpAsocModel
{
	/**
	 * Handles the entire registration process for DEFAULT users (not for people who register with
	 * 3rd party services, like facebook) and creates a new user in the database if everything is fine
	 *
	 * @return boolean Gives back the success status of the registration
	 */
	public static function registerUserIpAsoc()
	{
		// TODO this could be written simpler and cleaner

		// clean the input
		$user_id = Request::post('user_id');
		$ip = Request::post('ip');

		// write ip to db
		if (!userIpAsocModel::writeIpToDB($ip, $user_id)) {
			Session::add('feedback_negative', Text::get('FEEDBACK_ACCOUNT_CREATION_FAILED'));
		}

	}

	/**
	 * Writes the ip to database
	 *
	 * @param $ip
	 * @return bool
	 */
	public static function writeIpToDB($ip, $user_id)
	{
		$database = DatabaseFactory::getFactory()->getConnection();

		// write data into database
		$sql = "INSERT INTO userIpAsoc (ip, user_id)
                    VALUES (:ip, :user_id)";
		$query = $database->prepare($sql);
		$query->execute(array(':ip' => $ip,
		                      ':user_id' => $user_id));
		$count =  $query->rowCount();
		if ($count == 1) {
			return true;
		}

		return false;
	}
}
