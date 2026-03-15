# Normalization of the EVM System

## Identification of Relations

From the EVM Normalised ERD, the following relations were identified:

EVENT(EventID, EventName, EventDate, Location)

ATTENDEE(AttendeeID, Name, Email, Phone)

REGISTRATION(RegistrationID, EventID, AttendeeID, RegistrationDate)

PAYMENT(PaymentID, Amount, PaymentDate, RegistrationID)
## Functional Dependencies

EventID → EventName, EventDate, Location

AttendeeID → Name, Email, Phone

RegistrationID → EventID, AttendeeID, RegistrationDate

PaymentID → Amount, PaymentDate, RegistrationID

## First Normal Form (1NF)

All attributes contain atomic values and there are no repeating groups.  
Therefore the relations satisfy First Normal Form (1NF).

## Second Normal Form (2NF)
All relations are already in 1NF and all non-key attributes depend fully on the primary key.  
Therefore the relations satisfy Second Normal Form (2NF).

## Third Normal Form (3NF)

There are no transitive dependencies and all attributes depend only on the primary key.  
Therefore the relations satisfy Third Normal Form (3NF).

## Final Relations in 3NF

EVENT(EventID PK, EventName, EventDate, Location)

ATTENDEE(AttendeeID PK, Name, Email, Phone)

REGISTRATION(RegistrationID PK, EventID FK, AttendeeID FK, RegistrationDate)
PAYMENT(PaymentID PK, Amount, PaymentDate, RegistrationID FK)

**Conclusion:**  
The database design derived from the ER diagram satisfies Third Normal Form (3NF).
