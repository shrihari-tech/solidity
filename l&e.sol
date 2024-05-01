// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Contract {

    // Structure for User Data
    struct Users {
        string userName;
        uint score; // Track user's score
    }

    // Course structure
    struct Courses {
        uint id;
        string imgsrc;
        string title;
        string descrip;
        string videourl;
        uint price;
        mapping(address => bool) usersCompleted; // Mapping to track users who completed the course
    }

    // Leaderboard entry
    struct LeaderboardEntry {
        address user;
        uint score;
    }

    // Array to record all users address
    address[] usersAddress;

    // Array to record all id of course
    uint[] courseIds;

    // Array to record all Courses
    mapping(uint => Courses) public courseRecord;

    // Mapping of address of user to user data
    mapping (address => Users) public usersRecord;

    // Mapping of course id to leaderboard
    mapping (uint => LeaderboardEntry[]) public leaderboard;

    // Events for Smart Contract
    event registerNewUserEvent(address,string,uint,string);
    event courseCompletedEvent(address, uint, uint);

    // Creating a Course Provider account
    address private provider = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    // Add user
    function registerNewUser(string memory userName) external returns(string memory)  {
        if(bytes(usersRecord[msg.sender].userName).length == 0){
            usersAddress.push(msg.sender);
            usersRecord[msg.sender].userName = userName;
            emit registerNewUserEvent(msg.sender, userName, 0, "Registration Successful");
            return "Registration Successful!";
        }
        else {
            emit registerNewUserEvent(msg.sender, userName, 0, "You already have an Account");
            return "You have already have an Account";
        }
    }

    // Display User Profile
    function displayUserProfile() external view returns(string memory) {
        return usersRecord[msg.sender].userName;
    }
    
    // Add the function to mark a course as completed for a user
    function completeCourse(uint256 courseId, uint score) public {
        require(score >= 0, "Invalid score");
        require(score <= 100, "Invalid score");

        Courses storage course = courseRecord[courseId]; // Accessing course in storage

        course.usersCompleted[msg.sender] = true;
        usersRecord[msg.sender].score += score;
        emit courseCompletedEvent(msg.sender, courseId, score);
        updateLeaderboard(courseId, msg.sender, score);
    }

    // Add a function to check if a user completed a course
    function hasCompletedCourse(address user, uint256 courseId) public view returns (bool) {
        return courseRecord[courseId].usersCompleted[user];
    }

    // Function to update the leaderboard after course completion
    function updateLeaderboard(uint courseId, address user, uint score) internal {
        LeaderboardEntry[] storage board = leaderboard[courseId];
        board.push(LeaderboardEntry(user, score));
        sortLeaderboard(board);
        if (board.length > 5) {
            board.pop();
        }
    }

    // Function to sort the leaderboard entries
    function sortLeaderboard(LeaderboardEntry[] storage board) internal {
        for (uint i = 0; i < board.length; i++) {
            for (uint j = i + 1; j < board.length; j++) {
                if (board[i].score < board[j].score) {
                    LeaderboardEntry memory temp = board[i];
                    board[i] = board[j];
                    board[j] = temp;
                }
            }
        }
    }

    // Check for account
    function Login() external view returns (bool) {
        return bytes(usersRecord[msg.sender].userName).length > 0;
    }

    // Check for admin
    function checkAdmin() external view returns(bool){
        return msg.sender == provider;
    }

    // Function to get and store course
    function getCourse(uint _id, string memory _imgsrc, string memory _title, string memory _descrip, string memory _videourl, uint _price) external returns(string memory){
    if(_id > 0 && bytes(courseRecord[_id].videourl).length == 0){
        courseIds.push(_id);
        Courses storage newCourse = courseRecord[_id];
        newCourse.id = _id;
        newCourse.imgsrc = _imgsrc;
        newCourse.title = _title;
        newCourse.descrip = _descrip;
        newCourse.videourl = _videourl;
        newCourse.price = _price;
        return "Course Added";
    }
    else{
        return "Cannot Add Course";
    }
}

    // Display All Courses
    function displayCourses() external view returns(uint[] memory, string[] memory, string[] memory, string[] memory, string[] memory, uint[] memory){
        uint courseLength = courseIds.length;
        uint[] memory ids = new uint[](courseLength);
        string[] memory imgsrcs = new string[](courseLength);
        string[] memory titles = new string[](courseLength);
        string[] memory descrips = new string[](courseLength);
        string[] memory videourls = new string[](courseLength);
        uint[] memory prices = new uint[](courseLength);
        
        for(uint i=0; i < courseLength; i++){
            // Courses memory course = courseRecord[courseIds[i]];
            Courses storage course = courseRecord[courseIds[i]];
            ids[i] = course.id;
            imgsrcs[i] = course.imgsrc;
            titles[i] = course.title;
            descrips[i] = course.descrip;
            videourls[i] = course.videourl;
            prices[i] = course.price;
        }

        return (ids, imgsrcs, titles, descrips, videourls, prices);
    }

    // Get the leaderboard for a specific course
    function getLeaderboard(uint courseId) external view returns (LeaderboardEntry[] memory) {
        return leaderboard[courseId];
    }
}
