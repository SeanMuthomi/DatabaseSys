                                            Event Management System
The Event Management System is a relational database designed to streamline the planning and coordination of events.
                   Group Members
     1. Sean Muthomi                     190119
     2.Mohamed Abdikadir                 190125
     3.Geena Wambani                     184576
     4.Collins Owende                    192277
     5.Iancecil Waweru Njoroge                 134669
     6.Mueni Cindy Kimberly Diana        219930

     Project SDG
     SDG 8: Decent Work and Economic Growth
     Promote sustained, inclusive, and sustainable economic growth, full and productive employment, and decent work for all.


The Event Management System connects organizers, venues, attendees, tickets, staff, and sponsors in one unified system, replacing manual spreadsheets and WhatsApp-based workflows.It enforces data integrity through referential constraints, tracks ticket revenue and sponsorship contributions, and supports multiple events running simultaneously.

*DATABASE SCHEMA DESCRIPTION
The schema consists of multiple related tables connected through foreign and primary keys made to manage event operations. The main tables include;
1. ORGANIZER
2. ORGANIZER_PHONE
3. ORGANIZER_EMAIL
4. EVENT
5. VENUE
6. SPONSOR
7. EVENT_SPONSOR
8. STAFF
9. STAFF_ASSIGNMENT
10. ATTENDEE
11. TICKET

*ENTITY RELATIONSHIPS
1. One organizer can organize multiple events
2. Each event is held at one venue, while a venue can host a number of events
3. Attendees purchase tickets for events, each ticket is linked to one attendee and one event.
4. Events and sponsors have a many-to-many relationship implemented through the EVENT_SPONSOR table.
5. Staff members are assigned to events through the STAFF_ASSIGNMENT table
6. Organizer contact details are stored in the ORGANIZER_PHONE and ORGANIZER_EMAIL tables for database normalization.
