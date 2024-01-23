INSERT INTO forum_system.users (first_name, last_name, username, password, email, is_admin, is_banned, phone_number)
VALUES
('John', 'Doe', 'johndoe', 'Password1', 'johndoe@example.com', 1, 0, '0123456789'),
('Jane', 'Doe', 'janedoe', 'Password2', 'janedoe@example.com', 0, 0, NULL),
('Alice', 'Smith', 'alicesmith', 'Password3', 'alicesmith@example.com', 0, 0, NULL),
('Bobby', 'Johnson', 'bobjohnson', 'Password4', 'bobjohnson@example.com', 0, 0, NULL),
('Charlie', 'Brown', 'charliebrown', 'Password5', 'charliebrown@example.com', 0, 0, NULL),
('David', 'Williams', 'davidwilliams', 'Password6', 'davidwilliams@example.com', 0, 0, NULL),
('Even', 'Jones', 'evejones', 'Password7', 'evejones@example.com', 0, 0, NULL),
('Frank', 'Miller', 'frankmiller', 'Password8', 'frankmiller@example.com', 0, 0, NULL),
('Grace', 'Davis', 'gracedavis', 'Password9', 'gracedavis@example.com', 0, 1, NULL),
('Harry', 'Wilson', 'harrywilson', 'Password10', 'harrywilson@example.com', 0, 1, NULL);

INSERT INTO forum_system.posts (created_by_id, title, content, creation_date, `like`, dislike)
VALUES
    (1, 'Interesting Post Title 1', 'This is an interesting post. It has enough content to meet the minimum length requirement.', NOW(), 0, 0),
    (2, 'Another Interesting Post 2', 'This is another interesting post. It also has enough content to meet the minimum length requirement.', NOW(), 0, 0),
    (3, 'Yet Another Interesting Post 3', 'This is yet another interesting post. It has enough content to meet the minimum length requirement.', NOW(), 0, 0),
    (4, 'Interesting Post Title 4', 'This is an interesting post. It has enough content to meet the minimum length requirement.', NOW(), 0, 0),
    (5, 'Final Interesting Post 5', 'This is the final interesting post. It has enough content to meet the minimum length requirement.', NOW(), 0, 0),
    (6, 'New Interesting Post Title 6', 'This is a new interesting post. It has enough content to meet the minimum length requirement.', NOW(), 0, 0),
    (7, 'Another New Interesting Post 7', 'This is another new interesting post. It also has enough content to meet the minimum length requirement.', NOW(), 0, 0),
    (8, 'Yet Another New Interesting Post 8', 'This is yet another new interesting post. It has enough content to meet the minimum length requirement.', NOW(), 0, 0),
    (9, 'New Interesting Post Title 9', 'This is a new interesting post. It has enough content to meet the minimum length requirement.', NOW(), 0, 0),
    (10, 'Final New Interesting Post 10', 'This is the final new interesting post. It has enough content to meet the minimum length requirement.', NOW(), 0, 0),
    (10, 'New Interesting Post Title 11', 'This is a new interesting post. It has enough content to meet the minimum length requirement.', NOW(), 0, 0),
    (10, 'Another New Interesting Post 12', 'This is another new interesting post. It also has enough content to meet the minimum length requirement.', NOW(), 0, 0);

INSERT INTO forum_system.comments (post_id, created_by_id, content, creation_date, `like`, dislike)
VALUES
(1, 2, 'This is a comment on the first post. It is long enough to meet the minimum length requirement.', NOW(), 0, 0),
(2, 3, 'This is a comment on the second post. It is also long enough to meet the minimum length requirement.', NOW(), 0, 0),
(3, 4, 'This is a comment on the third post. It is long enough to meet the minimum length requirement.', NOW(), 0, 0),
(4, 5, 'This is a comment on the fourth post. It is long enough to meet the minimum length requirement.', NOW(), 0, 0),
(5, 1, 'This is a comment on the fifth post. It is long enough to meet the minimum length requirement.', NOW(), 0, 0),
(6, 3, 'This is a comment on the sixth post. It is long enough to meet the minimum length requirement.', NOW(), 0, 0),
(7, 4, 'This is a comment on the seventh post. It is also long enough to meet the minimum length requirement.', NOW(), 0, 0),
(8, 5, 'This is a comment on the eighth post. It is long enough to meet the minimum length requirement.', NOW(), 0, 0),
(9, 1, 'This is a comment on the ninth post. It is long enough to meet the minimum length requirement.', NOW(), 0, 0),
(10, 2, 'This is a comment on the tenth post. It is long enough to meet the minimum length requirement.', NOW(), 0, 0);