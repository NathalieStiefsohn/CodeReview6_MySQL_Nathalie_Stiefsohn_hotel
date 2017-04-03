-- When asking questions of the database, managers may need to know:

-- How many rooms are currently available for booking?


SELECT
    COUNT(rooms.room)
FROM `rooms`
WHERE room IN (
SELECT 
    rooms.room
FROM  
    rooms
JOIN booking on rooms.id = booking.FK_rooms
WHERE
    CURDATE() NOT between date(booking.from) AND date(booking.to)
GROUP BY rooms.id);

-- +-------------------+
--  | count(rooms.room) | 
--  +-------------------+
--  | 2                 | 
--  +-------------------+

-- What facilities are available in particular rooms?

SELECT 
    rooms.room,
    facilities.facility
FROM 
    `facilities`
JOIN rooms_facilities ON facilities.id = rooms_facilities.FK_facilities
JOIN rooms ON rooms_facilities.FK_rooms = rooms.id;

-- Which Guests are booked in this week?
SELECT
    contact_information.first_name, 
    contact_information.last_name, 
    booking.from,
    booking.to
FROM `contact_information`
JOIN guests ON contact_information.id = guests.FK_contact_information
JOIN booking ON guests.FK_bookings = booking.id
WHERE
    (date(booking.from) > "2017-03-26" AND date(booking.from) < "2017-04-03")
	OR
    (date(booking.to) > "2017-03-26" AND date(booking.to) < "2017-04-03");

-- Which Guests have used a room service? etc.
SELECT
    contact_information.first_name, 
    contact_information.last_name,
    room_service_calls.date
FROM contact_information
JOIN guests ON contact_information.id = guests.FK_contact_information
JOIN room_service_calls ON guests.id = room_service_calls.FK_guests;

-- WHICH GUEST SLEPT IN WHICH ROOM TYPE?

SELECT 
    contact_information.first_name, 
    contact_information.last_name,
    rooms.room,
    room_types.type
FROM `contact_information`
JOIN guests ON contact_information.id = guests.FK_contact_information
JOIN booking ON guests.FK_bookings = booking.id
JOIN rooms ON booking.FK_rooms = rooms.id
JOIN room_types ON rooms.FK_room_types = room_types.id;