trigger deleteAccount on Account (after delete) {
    System.debug('Account Deleted Successfully');
}