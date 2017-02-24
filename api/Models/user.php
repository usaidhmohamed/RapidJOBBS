<?php

function addUser() {
	error_log('addUser\n', 3, '/var/tmp/php.log');
	$request = Slim::getInstance()->request();
	$user = json_decode($request->getBody());
	$sql = "INSERT INTO user (firstname, lastname, username, password) VALUES (:firstname, :lastname, :username, :password)";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$stmt->bindParam("firstname", $user->firstname);
		$stmt->bindParam("lastname", $user->lastname);
		$stmt->bindParam("username", $user->username);
		$stmt->bindParam("password", $user->password);
		$stmt->execute();
		$user->id = $db->lastInsertId();
		$db = null;
		echo json_encode($user);
	} catch(PDOException $e) {
		error_log($e->getMessage(), 3, '/var/tmp/php.log');
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}

?>