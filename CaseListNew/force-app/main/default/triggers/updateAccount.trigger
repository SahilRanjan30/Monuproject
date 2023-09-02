trigger updateAccount on Account (before insert) {
	System.debug('New Account has been created successfully');
}