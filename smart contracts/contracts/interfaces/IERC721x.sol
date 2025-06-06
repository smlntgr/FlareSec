// request struct
// validate events - approved, denied

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

interface IERC721x {
    enum Status { Pending, Approved, Denied }
    enum RequestType { Approval, Transfer, TransferFrom }

    struct Request {
        address owner;
        address spender;
        address receiver;
        uint256 tokenId;
        Status status;
        uint256 initiatedTime;
    }

    struct Validation {
        string endpoint;
        address validator;
    }

    event ApprovalCreated(uint256 indexed reqId, address indexed owner, address indexed spender, uint256 tokenId, Status status, uint256 initiatedTime, address validator);
    event TransferCreated(uint256 indexed reqId, address indexed sender, address indexed receiver, uint256 tokenId, Status status, uint256 initiatedTime, address validator);
    event TransferFromCreated(uint256 indexed reqid, address indexed owner, address indexed spender, address receiver, uint256 tokenId, Status status, uint256 initiatedTime, address validator);
    event RequestApproved(uint256 indexed reqid);
    event RequestDenied(uint256 indexed reqid);
}
