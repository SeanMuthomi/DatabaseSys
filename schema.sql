-- ============================================================
-- Event Management System (EMS) - Database Schema
-- ============================================================

-- ORGANIZER: Stores event organizer details
CREATE TABLE ORGANIZER (
    OrganizerID   INT          NOT NULL AUTO_INCREMENT,
    FirstName     VARCHAR(50)  NOT NULL,
    LastName      VARCHAR(50)  NOT NULL,
    Organization  VARCHAR(100),
    PRIMARY KEY (OrganizerID)
);

-- ORGANIZER_PHONE: Stores organizer phone numbers (normalized)
CREATE TABLE ORGANIZER_PHONE (
    PhoneID       INT          NOT NULL AUTO_INCREMENT,
    OrganizerID   INT          NOT NULL,
    PhoneNumber   VARCHAR(20)  NOT NULL,
    PRIMARY KEY (PhoneID),
    FOREIGN KEY (OrganizerID) REFERENCES ORGANIZER(OrganizerID) ON DELETE CASCADE
);

-- ORGANIZER_EMAIL: Stores organizer email addresses (normalized)
CREATE TABLE ORGANIZER_EMAIL (
    EmailID       INT          NOT NULL AUTO_INCREMENT,
    OrganizerID   INT          NOT NULL,
    EmailAddress  VARCHAR(100) NOT NULL,
    PRIMARY KEY (EmailID),
    FOREIGN KEY (OrganizerID) REFERENCES ORGANIZER(OrganizerID) ON DELETE CASCADE
);

-- VENUE: Stores venue information
CREATE TABLE VENUE (
    VenueID       INT          NOT NULL AUTO_INCREMENT,
    VenueName     VARCHAR(100) NOT NULL,
    Location      VARCHAR(200) NOT NULL,
    Capacity      INT          NOT NULL,
    PRIMARY KEY (VenueID)
);

-- EVENT: Stores event details; each event belongs to one organizer and one venue
CREATE TABLE EVENT (
    EventID       INT          NOT NULL AUTO_INCREMENT,
    EventName     VARCHAR(100) NOT NULL,
    EventDate     DATE         NOT NULL,
    EventTime     TIME,
    Description   TEXT,
    OrganizerID   INT          NOT NULL,
    VenueID       INT          NOT NULL,
    PRIMARY KEY (EventID),
    FOREIGN KEY (OrganizerID) REFERENCES ORGANIZER(OrganizerID),
    FOREIGN KEY (VenueID)     REFERENCES VENUE(VenueID)
);

-- SPONSOR: Stores sponsor details
CREATE TABLE SPONSOR (
    SponsorID     INT          NOT NULL AUTO_INCREMENT,
    SponsorName   VARCHAR(100) NOT NULL,
    ContactPerson VARCHAR(100),
    ContactEmail  VARCHAR(100),
    ContactPhone  VARCHAR(20),
    PRIMARY KEY (SponsorID)
);

-- EVENT_SPONSOR: Junction table for many-to-many relationship between EVENT and SPONSOR
CREATE TABLE EVENT_SPONSOR (
    EventID            INT             NOT NULL,
    SponsorID          INT             NOT NULL,
    SponsorshipAmount  DECIMAL(10, 2),
    PRIMARY KEY (EventID, SponsorID),
    FOREIGN KEY (EventID)   REFERENCES EVENT(EventID),
    FOREIGN KEY (SponsorID) REFERENCES SPONSOR(SponsorID)
);

-- STAFF: Stores staff member details
CREATE TABLE STAFF (
    StaffID       INT         NOT NULL AUTO_INCREMENT,
    FirstName     VARCHAR(50) NOT NULL,
    LastName      VARCHAR(50) NOT NULL,
    Role          VARCHAR(50),
    ContactEmail  VARCHAR(100),
    ContactPhone  VARCHAR(20),
    PRIMARY KEY (StaffID)
);

-- STAFF_ASSIGNMENT: Junction table assigning staff members to events
CREATE TABLE STAFF_ASSIGNMENT (
    AssignmentID     INT          NOT NULL AUTO_INCREMENT,
    StaffID          INT          NOT NULL,
    EventID          INT          NOT NULL,
    DutyDescription  VARCHAR(200),
    PRIMARY KEY (AssignmentID),
    FOREIGN KEY (StaffID)  REFERENCES STAFF(StaffID),
    FOREIGN KEY (EventID)  REFERENCES EVENT(EventID)
);

-- ATTENDEE: Stores attendee information
CREATE TABLE ATTENDEE (
    AttendeeID  INT          NOT NULL AUTO_INCREMENT,
    FirstName   VARCHAR(50)  NOT NULL,
    LastName    VARCHAR(50)  NOT NULL,
    Email       VARCHAR(100) NOT NULL UNIQUE,
    Phone       VARCHAR(20),
    PRIMARY KEY (AttendeeID)
);

-- TICKET: Links attendees to events; tracks ticket revenue
CREATE TABLE TICKET (
    TicketID      INT             NOT NULL AUTO_INCREMENT,
    EventID       INT             NOT NULL,
    AttendeeID    INT             NOT NULL,
    TicketType    VARCHAR(50),
    Price         DECIMAL(10, 2)  NOT NULL,
    PurchaseDate  DATE            NOT NULL,
    SeatNumber    VARCHAR(10),
    PRIMARY KEY (TicketID),
    FOREIGN KEY (EventID)    REFERENCES EVENT(EventID),
    FOREIGN KEY (AttendeeID) REFERENCES ATTENDEE(AttendeeID)
);
