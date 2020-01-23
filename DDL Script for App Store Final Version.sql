/*
Created: 4/2/2018
Modified: 4/4/2018
Model: Microsoft SQL Server 2016
Database: MS SQL Server 2016
*/


-- Create tables section -------------------------------------------------

-- Table User_Search_Tendancies

CREATE TABLE [User_Search_Tendancies]
(
 [Search_Id] Int NOT NULL,
 [Searched_Text1] Varchar(25) NOT NULL,
 [Searched_Text2] Varchar(25) NULL,
 [Searched_Text3] Varchar(25) NULL,
 [Searched_Text4] Varchar(25) NULL,
 [Searched_Text5] Varchar(25) NULL,
 [User_Id] Int NOT NULL
)
go

-- Create indexes for table User_Search_Tendancies

CREATE INDEX [IX_Relationship7] ON [User_Search_Tendancies] ([User_Id])
go

-- Add keys for table User_Search_Tendancies

ALTER TABLE [User_Search_Tendancies] ADD CONSTRAINT [Key1] PRIMARY KEY ([Search_Id])
go

-- Table User_Creditcard_Info_Bridge

CREATE TABLE [User_Creditcard_Info_Bridge]
(
 [User_Id] Int NOT NULL,
 [Creditcard_info_id] Int NOT NULL
)
go

-- Add keys for table User_Creditcard_Info_Bridge

ALTER TABLE [User_Creditcard_Info_Bridge] ADD CONSTRAINT [Key2] PRIMARY KEY ([User_Id],[Creditcard_info_id])
go

-- Table User_Giftcard_Bridge

CREATE TABLE [User_Giftcard_Bridge]
(
 [User_Id] Int NOT NULL,
 [Giftcard_Id] Int NOT NULL
)
go

-- Add keys for table User_Giftcard_Bridge

ALTER TABLE [User_Giftcard_Bridge] ADD CONSTRAINT [Key3] PRIMARY KEY ([User_Id],[Giftcard_Id])
go

-- Table User_Ratings_&_Reviews

CREATE TABLE [User_Ratings_&_Reviews]
(
 [Rating_Review_id] Int NOT NULL,
 [Rating] Float NOT NULL,
 [Review] Varchar(2000) NULL,
 [Rated_Date] Datetime NOT NULL,
 [User_Id] Int NOT NULL,
 [Application_Id] Int NOT NULL,
 [Version_id] Int NOT NULL
)
go

-- Create indexes for table User_Ratings_&_Reviews

CREATE INDEX [IX_Relationship1] ON [User_Ratings_&_Reviews] ([User_Id])
go

CREATE INDEX [IX_Relationship11] ON [User_Ratings_&_Reviews] ([Application_Id])
go

CREATE INDEX [IX_Relationship21] ON [User_Ratings_&_Reviews] ([Version_id])
go

-- Add keys for table User_Ratings_&_Reviews

ALTER TABLE [User_Ratings_&_Reviews] ADD CONSTRAINT [Key4] PRIMARY KEY ([Rating_Review_id])
go

-- Table User_Creditcard_info

CREATE TABLE [User_Creditcard_info]
(
 [Creditcard_info_id] Int NOT NULL,
 [Name_on_Credit_card] Varchar(15) NOT NULL,
 [Creditcard_Number] Varchar(16) NOT NULL,
 [CVV_Number] Int NOT NULL
)
go

-- Add keys for table User_Creditcard_info

ALTER TABLE [User_Creditcard_info] ADD CONSTRAINT [Key5] PRIMARY KEY ([Creditcard_info_id])
go

-- Table Giftcard_Redemption_Details

CREATE TABLE [Giftcard_Redemption_Details]
(
 [Giftcard_Id] Int NOT NULL,
 [Giftcard_Number] Varchar(20) NOT NULL,
 [Amount_Redeemed] Money NOT NULL,
 [Redeem_Date_Time] Datetime NOT NULL
)
go

-- Add keys for table Giftcard_Redemption_Details

ALTER TABLE [Giftcard_Redemption_Details] ADD CONSTRAINT [Key6] PRIMARY KEY ([Giftcard_Id])
go

-- Table User

CREATE TABLE [User]
(
 [User_Id] Int NOT NULL,
 [User_Firstname] Char(15) NOT NULL,
 [User_Lastname] Char(20) NULL,
 [User_DOB] Date NOT NULL,
 [Primary_Phone_Number] Varchar(10) NOT NULL,
 [User_Account_Balance] Money NOT NULL,
 [IsActive] Binary(1) NOT NULL,
 [Email_Id] Char(20) NOT NULL,
 [Login_info_id] Int NOT NULL
)
go

-- Create indexes for table User

CREATE INDEX [IX_Relationship22] ON [User] ([Login_info_id])
go

-- Add keys for table User

ALTER TABLE [User] ADD CONSTRAINT [Key7] PRIMARY KEY ([User_Id])
go

-- Table Device_Details

CREATE TABLE [Device_Details]
(
 [Device_id] Int NOT NULL,
 [Device_type] Char(10) NOT NULL,
 [Device_name] Varchar(20) NOT NULL,
 [Device_OS_Specifications] Varchar(20) NULL,
 [Device_Hardware_Specifications] Varchar(20) NULL,
 [User_Id] Int NOT NULL
)
go

-- Create indexes for table Device_Details

CREATE INDEX [IX_Relationship1] ON [Device_Details] ([User_Id])
go

-- Add keys for table Device_Details

ALTER TABLE [Device_Details] ADD CONSTRAINT [Key8] PRIMARY KEY ([Device_id])
go

-- Table Contact_info

CREATE TABLE [Contact_info]
(
 [Contact_info_id] Int NOT NULL,
 [Contact_Number_1] Varchar(12) NOT NULL,
 [User_Id] Int NULL,
 [Author_id] Int NULL
)
go

-- Create indexes for table Contact_info

CREATE INDEX [IX_Relationship4] ON [Contact_info] ([User_Id])
go

CREATE INDEX [IX_Relationship9] ON [Contact_info] ([Author_id])
go

-- Add keys for table Contact_info

ALTER TABLE [Contact_info] ADD CONSTRAINT [Key9] PRIMARY KEY ([Contact_info_id])
go

-- Table Login_info

CREATE TABLE [Login_info]
(
 [Login_info_id] Int NOT NULL,
 [Username] Varchar(20) NOT NULL,
 [Password] Varchar(20) NOT NULL
)
go

-- Add keys for table Login_info

ALTER TABLE [Login_info] ADD CONSTRAINT [Key10] PRIMARY KEY ([Login_info_id])
go

-- Table Address_info

CREATE TABLE [Address_info]
(
 [Address_info_Id] Int NOT NULL,
 [Street_line_1] Varchar(25) NOT NULL,
 [Street_line_2] Varchar(25) NULL,
 [City] Char(15) NOT NULL,
 [State] Char(15) NOT NULL,
 [Zipcode] Varchar(6) NOT NULL,
 [User_Id] Int NULL,
 [Author_id] Int NULL
)
go

-- Create indexes for table Address_info

CREATE INDEX [IX_Relationship5] ON [Address_info] ([User_Id])
go

CREATE INDEX [IX_Relationship10] ON [Address_info] ([Author_id])
go

-- Add keys for table Address_info

ALTER TABLE [Address_info] ADD CONSTRAINT [Key11] PRIMARY KEY ([Address_info_Id])
go

-- Table Author_Payments

CREATE TABLE [Author_Payments]
(
 [Invoice_id] Int NOT NULL,
 [Payment_Date] Datetime NOT NULL,
 [Amount] Money NOT NULL,
 [Author_id] Int NOT NULL
)
go

-- Create indexes for table Author_Payments

CREATE INDEX [IX_Relationship3] ON [Author_Payments] ([Author_id])
go

-- Add keys for table Author_Payments

ALTER TABLE [Author_Payments] ADD CONSTRAINT [Key12] PRIMARY KEY ([Invoice_id])
go

-- Table Author_Bank_Account_info

CREATE TABLE [Author_Bank_Account_info]
(
 [Author_Bank_Account_info_id] Int NOT NULL,
 [Bank_Name] Varchar(25) NOT NULL,
 [Bank_Address_with_Zipcode] Varchar(50) NULL,
 [Account_Number] Varchar(15) NOT NULL,
 [Routing_Number] Varchar(15) NOT NULL
)
go

-- Add keys for table Author_Bank_Account_info

ALTER TABLE [Author_Bank_Account_info] ADD CONSTRAINT [Key13] PRIMARY KEY ([Author_Bank_Account_info_id])
go

-- Table Author

CREATE TABLE [Author]
(
 [Author_id] Int NOT NULL,
 [Author_Type] Char(20) NOT NULL,
 [Author_or_organization_Name] Varchar(25) NOT NULL,
 [Author_webpage_Link] Varchar(30) NULL,
 [Author_Bank_Account_info_id] Int NOT NULL,
 [Login_info_id] Int NOT NULL
)
go

-- Create indexes for table Author

CREATE INDEX [IX_Relationship2] ON [Author] ([Author_Bank_Account_info_id])
go

CREATE INDEX [IX_Relationship24] ON [Author] ([Login_info_id])
go

-- Add keys for table Author

ALTER TABLE [Author] ADD CONSTRAINT [Key14] PRIMARY KEY ([Author_id])
go

-- Table Application_Requirements

CREATE TABLE [Application_Requirements]
(
 [Requirements_Id] Int NOT NULL,
 [Device_OS_Requirement] Varchar(15) NOT NULL,
 [Device_RAM_Requirement] Varchar(15) NOT NULL,
 [Free_Space_Needed_On_Device] Float NOT NULL
)
go

-- Add keys for table Application_Requirements

ALTER TABLE [Application_Requirements] ADD CONSTRAINT [Key15] PRIMARY KEY ([Requirements_Id])
go

-- Table Application_Extras

CREATE TABLE [Application_Extras]
(
 [Extras_Id] Int NOT NULL,
 [App_Icon] Image NOT NULL,
 [App_Screenshot1] Image NULL,
 [App_Screenshot2] Image NULL,
 [App_Screenshot3] Image NULL,
 [App_Screenshot4] Image NULL,
 [App_Screenshot5] Image NULL
)
go

-- Add keys for table Application_Extras

ALTER TABLE [Application_Extras] ADD CONSTRAINT [Key16] PRIMARY KEY ([Extras_Id])
go

-- Table Application_Categories_Bridge

CREATE TABLE [Application_Categories_Bridge]
(
 [Application_Id] Int NOT NULL,
 [Category_id] Int NOT NULL
)
go

-- Add keys for table Application_Categories_Bridge

ALTER TABLE [Application_Categories_Bridge] ADD CONSTRAINT [Key17] PRIMARY KEY ([Application_Id],[Category_id])
go

-- Table Application_Categories

CREATE TABLE [Application_Categories]
(
 [Category_id] Int NOT NULL,
 [Category_Name] Char(15) NOT NULL
)
go

-- Add keys for table Application_Categories

ALTER TABLE [Application_Categories] ADD CONSTRAINT [Key18] PRIMARY KEY ([Category_id])
go

ALTER TABLE [Application_Categories] ADD CONSTRAINT [Category_Name] UNIQUE CLUSTERED ([Category_Name])
go

-- Table Application_Version

CREATE TABLE [Application_Version]
(
 [Version_id] Int NOT NULL,
 [Application_Version] Float NOT NULL,
 [Published_date] Datetime NOT NULL,
 [Version_End_date] Datetime NULL,
 [Application_Id] Int NOT NULL
)
go

-- Create indexes for table Application_Version

CREATE INDEX [IX_Relationship5] ON [Application_Version] ([Application_Id])
go

-- Add keys for table Application_Version

ALTER TABLE [Application_Version] ADD CONSTRAINT [Key19] PRIMARY KEY ([Version_id])
go

-- Table Application

CREATE TABLE [Application]
(
 [Application_Id] Int NOT NULL,
 [Application_Name] Char(30) NOT NULL,
 [Published_Date] Datetime NOT NULL,
 [In_App_Payments] Binary(1) NOT NULL,
 [In_App_Advertisements] Binary(1) NOT NULL,
 [isVerified] Binary(1) NOT NULL,
 [Application_Cost] Money NOT NULL,
 [Requirements_Id] Int NOT NULL,
 [Extras_Id] Int NOT NULL,
 [Support_id] Int NOT NULL,
 [Author_id] Int NOT NULL
)
go

-- Create indexes for table Application

CREATE INDEX [IX_Relationship2] ON [Application] ([Requirements_Id])
go

CREATE INDEX [IX_Relationship3] ON [Application] ([Extras_Id])
go

CREATE INDEX [IX_Relationship4] ON [Application] ([Support_id])
go

CREATE INDEX [IX_Relationship15] ON [Application] ([Author_id])
go

-- Add keys for table Application

ALTER TABLE [Application] ADD CONSTRAINT [Key20] PRIMARY KEY ([Application_Id])
go

ALTER TABLE [Application] ADD CONSTRAINT [Application_Name] UNIQUE CLUSTERED ([Application_Name])
go

-- Table Application_Support

CREATE TABLE [Application_Support]
(
 [Support_id] Int NOT NULL,
 [Support_Contact_info] Char(10) NOT NULL,
 [Support_Website1] Varchar(20) NOT NULL,
 [Support_Website2] Varchar(20) NULL,
 [Support_Website3] Varchar(20) NULL,
 [Forum_Link1] Varbinary(20) NOT NULL,
 [Forum_Link2] Varchar(20) NULL,
 [Forum_Link3] Varchar(20) NULL
)
go

-- Add keys for table Application_Support

ALTER TABLE [Application_Support] ADD CONSTRAINT [Key21] PRIMARY KEY ([Support_id])
go

-- Table Incident_logger

CREATE TABLE [Incident_logger]
(
 [Incident_ID] Int NOT NULL,
 [Incident_Details_Provided_by_User] Char(2000) NOT NULL,
 [Incident_Raised_Time] Datetime NOT NULL,
 [Priority] Char(15) NULL,
 [User_Id] Int NOT NULL,
 [Application_Id] Int NOT NULL,
 [Version_id] Int NOT NULL
)
go

-- Create indexes for table Incident_logger

CREATE INDEX [IX_Relationship12] ON [Incident_logger] ([User_Id])
go

CREATE INDEX [IX_Relationship13] ON [Incident_logger] ([Application_Id])
go

CREATE INDEX [IX_Relationship25] ON [Incident_logger] ([Version_id])
go

-- Add keys for table Incident_logger

ALTER TABLE [Incident_logger] ADD CONSTRAINT [Key22] PRIMARY KEY ([Incident_ID])
go

-- Table Purchase_Application

CREATE TABLE [Purchase_Application]
(
 [Purchase_Id] Int NOT NULL,
 [Paid_Amount] Money NOT NULL,
 [Purchase_Date_Time] Datetime NOT NULL,
 [User_Id] Int NOT NULL,
 [Application_Id] Int NOT NULL
)
go

-- Create indexes for table Purchase_Application

CREATE INDEX [IX_Relationship16] ON [Purchase_Application] ([User_Id])
go

CREATE INDEX [IX_Relationship18] ON [Purchase_Application] ([Application_Id])
go

-- Add keys for table Purchase_Application

ALTER TABLE [Purchase_Application] ADD CONSTRAINT [Key23] PRIMARY KEY ([Purchase_Id])
go

-- Table Download

CREATE TABLE [Download]
(
 [Download_id] Int NOT NULL,
 [Download_Date_Time] Datetime NOT NULL,
 [Download_Status] Char(20) NULL,
 [User_Id] Int NOT NULL,
 [Application_Id] Int NOT NULL,
 [Version_id] Int NOT NULL,
 [Device_id] Int NOT NULL
)
go

-- Create indexes for table Download

CREATE INDEX [IX_Relationship17] ON [Download] ([User_Id])
go

CREATE INDEX [IX_Relationship19] ON [Download] ([Application_Id])
go

CREATE INDEX [IX_Relationship20] ON [Download] ([Version_id])
go

CREATE INDEX [IX_Relationship27] ON [Download] ([Device_id])
go

-- Add keys for table Download

ALTER TABLE [Download] ADD CONSTRAINT [Key24] PRIMARY KEY ([Download_id])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [User_Search_Tendancies] ADD CONSTRAINT [One user can have 0, 1 or more than one record in Search_Tendancies table] FOREIGN KEY ([User_Id]) REFERENCES [User] ([User_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [User_Creditcard_Info_Bridge] ADD CONSTRAINT [One Creditcard information can be associated with 1 or many users] FOREIGN KEY ([Creditcard_info_id]) REFERENCES [User_Creditcard_info] ([Creditcard_info_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [User_Creditcard_Info_Bridge] ADD CONSTRAINT [One User can be associated with 0, 1 or many Credit cards] FOREIGN KEY ([User_Id]) REFERENCES [User] ([User_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [User_Giftcard_Bridge] ADD CONSTRAINT [One giftcard can be associated with 1 or more than one users] FOREIGN KEY ([Giftcard_Id]) REFERENCES [Giftcard_Redemption_Details] ([Giftcard_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [User_Giftcard_Bridge] ADD CONSTRAINT [One user can be associated with 0, 1 or many giftcards] FOREIGN KEY ([User_Id]) REFERENCES [User] ([User_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [User_Ratings_&_Reviews] ADD CONSTRAINT [One user can give 0 or one review for each version] FOREIGN KEY ([User_Id]) REFERENCES [User] ([User_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Device_Details] ADD CONSTRAINT [One Author can have 0,1 or more devices] FOREIGN KEY ([User_Id]) REFERENCES [User] ([User_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Contact_info] ADD CONSTRAINT [One user can have 0,1 or more contact information associated with him/her] FOREIGN KEY ([User_Id]) REFERENCES [User] ([User_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Address_info] ADD CONSTRAINT [One user can have 0,1 or more addresses associated with him/her] FOREIGN KEY ([User_Id]) REFERENCES [User] ([User_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Author] ADD CONSTRAINT [One Author_Id can be associated with only one bank account details] FOREIGN KEY ([Author_Bank_Account_info_id]) REFERENCES [Author_Bank_Account_info] ([Author_Bank_Account_info_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Author_Payments] ADD CONSTRAINT [One Author can have 0,1 or many Author payments] FOREIGN KEY ([Author_id]) REFERENCES [Author] ([Author_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Contact_info] ADD CONSTRAINT [One Author can have 0,1 or many contact information associated with him/her] FOREIGN KEY ([Author_id]) REFERENCES [Author] ([Author_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Address_info] ADD CONSTRAINT [One Author can have 0,1 or may address details associatred with him/her] FOREIGN KEY ([Author_id]) REFERENCES [Author] ([Author_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Application_Categories_Bridge] ADD CONSTRAINT [One Category can have many applications associated to it] FOREIGN KEY ([Category_id]) REFERENCES [Application_Categories] ([Category_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Application_Categories_Bridge] ADD CONSTRAINT [One Application can fall under many categories] FOREIGN KEY ([Application_Id]) REFERENCES [Application] ([Application_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Application_Version] ADD CONSTRAINT [One Application can have one or more versions associated with it] FOREIGN KEY ([Application_Id]) REFERENCES [Application] ([Application_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Application] ADD CONSTRAINT [One Application can have only 1 Support_id associated with it] FOREIGN KEY ([Support_id]) REFERENCES [Application_Support] ([Support_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Application] ADD CONSTRAINT [One Application must have one Extras_id] FOREIGN KEY ([Extras_Id]) REFERENCES [Application_Extras] ([Extras_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Application] ADD CONSTRAINT [One Application can have only one set or requirements] FOREIGN KEY ([Requirements_Id]) REFERENCES [Application_Requirements] ([Requirements_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [User_Ratings_&_Reviews] ADD CONSTRAINT [One app can have 0,1 or many user reviews and ratings associated with it] FOREIGN KEY ([Application_Id]) REFERENCES [Application] ([Application_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Incident_logger] ADD CONSTRAINT [One User can raise 0,1 or may incidents for one application] FOREIGN KEY ([User_Id]) REFERENCES [User] ([User_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Incident_logger] ADD CONSTRAINT [One application can have 0,1 or many incidents raised on it] FOREIGN KEY ([Application_Id]) REFERENCES [Application] ([Application_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Application] ADD CONSTRAINT [One author can develop 1 or more than one applications] FOREIGN KEY ([Author_id]) REFERENCES [Author] ([Author_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Purchase_Application] ADD CONSTRAINT [One User can have 1 or many purchases] FOREIGN KEY ([User_Id]) REFERENCES [User] ([User_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Download] ADD CONSTRAINT [One User can download 0,1 or many applications] FOREIGN KEY ([User_Id]) REFERENCES [User] ([User_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Purchase_Application] ADD CONSTRAINT [One application can be purchased by 0, 1 or many Users] FOREIGN KEY ([Application_Id]) REFERENCES [Application] ([Application_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Download] ADD CONSTRAINT [One Application can be downloaded by 0,1 or many users] FOREIGN KEY ([Application_Id]) REFERENCES [Application] ([Application_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Download] ADD CONSTRAINT [One Application version can be downloaded by 0,1 or many users] FOREIGN KEY ([Version_id]) REFERENCES [Application_Version] ([Version_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [User_Ratings_&_Reviews] ADD CONSTRAINT [One Application Version can have 0,1 or many rartings and reviews] FOREIGN KEY ([Version_id]) REFERENCES [Application_Version] ([Version_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [User] ADD CONSTRAINT [One user can have only one pair of login credentials] FOREIGN KEY ([Login_info_id]) REFERENCES [Login_info] ([Login_info_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Author] ADD CONSTRAINT [One Author should have only 1 login credential pair associated with him/her] FOREIGN KEY ([Login_info_id]) REFERENCES [Login_info] ([Login_info_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Incident_logger] ADD CONSTRAINT [One Version can have 0,1 or many incidents raised against it] FOREIGN KEY ([Version_id]) REFERENCES [Application_Version] ([Version_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Download] ADD CONSTRAINT [One device can download 0,1 or many applications] FOREIGN KEY ([Device_id]) REFERENCES [Device_Details] ([Device_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




