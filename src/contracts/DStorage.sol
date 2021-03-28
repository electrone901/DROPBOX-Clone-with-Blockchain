pragma solidity ^0.5.0;

contract DStorage {
    // Name
    string public name = "DStorage";
    // Number of files
    uint256 public fileCount = 0;
    // Mapping fileId=>Struct
    mapping(uint256 => File) public files;
    // Struct is our own data types, defines all attribuates of our dropbox file
    struct File {
        uint256 fileId;
        string fileHash;
        uint256 fileSize;
        string fileType;
        string fileName;
        string fileDescription;
        uint256 uploadTime;
        address payable uploader;
    }

    // Event
    event FileUploaded(
        uint256 fileIdId,
        string fileHash,
        uint256 fileSize,
        string fileType,
        string fileName,
        string fileDescription,
        uint256 uploadTime,
        address payable uploader
    );

    constructor() public {}

    // Upload File function
    function uploadFile(
        string memory _fileHash,
        uint256 _fileSize,
        string memory _fileType,
        string memory _fileName,
        string memory _fileDescription
    ) public {
        // Make sure the file hash exists, msg is a  solidity global  variable that we have access

        // makes sure something is true before continuing
        // Make sure file type exists
        // Make sure file description exists
        // Make sure file fileName exists
        // Make sure uploader address exists
        // Make sure file size is more than 0
        // Increment file id
        // Add File to the contract
        require(bytes(_fileHash).length > 0);
        require(bytes(_fileType).length > 0);
        require(bytes(_fileDescription).length > 0);
        require(bytes(_fileName).length > 0);
        require(msg.sender != address(0));
        require(_fileSize > 0);

        fileCount++;
        files[1] = File(
            fileCount,
            _fileHash,
            _fileSize,
            _fileType,
            _fileName,
            _fileDescription,
            now,
            msg.sender
        );

        // Trigger an event
        emit FileUploaded(
            fileCount,
            _fileHash,
            _fileSize,
            _fileType,
            _fileName,
            _fileDescription,
            now,
            msg.sender
        );
    }
}
