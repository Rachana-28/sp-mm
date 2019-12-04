use Training_19Sep19_Pune
go


CREATE PROC usp_InsertSubscriber
(
@SubscriberName varchar(20),
@Address VARCHAR(50),
@ContactNumber   BIGINT,
    @AreaOfInterest   VARCHAR (50),
    @EmailID         VARCHAR (50)  ,
    @SubscribedUserID VARCHAR (50)  ,
    @Password         VARCHAR (50) ,
    @CreditCardnumber VARCHAR (50)  ,
	@CardHolderName   VARCHAR (50) ,
    @ExpiryDate       DATE        ,
    @CVV              INT        ,
    @CardType        VARCHAR (50) 
)
AS
Begin
INSERT INTO Subscribers
(SubscriberName,Address,ContactNumber,AreaOfInterest,EmailID,SubscribedUserID,Password,CreditCardnumber,CardHolderName,ExpiryDate,CVV,CardType)
VALUES
(@SubscriberName,@Address,@ContactNumber,@AreaOfInterest,@EmailID,@SubscribedUserID,@Password,@CreditCardnumber,@CardHolderName,@ExpiryDate,@CVV,@CardType )

END

--------------------------------------------------------------------------------------

CREATE PROC usp_NonInsertSubscriber
(
@NonSubscriberName varchar(20),
@Address VARCHAR(50),
@ContactNumber   BIGINT,
    @AreaOfInterest   VARCHAR (50),
    @EmailID         VARCHAR (50)  ,
    @NonSubscriberUserID VARCHAR (50)  ,
    @Password         VARCHAR (50) 
 
)
AS
Begin
INSERT INTO NonSubscribers
(NonSubscriberName,Address,ContactNumber,AreaOfInterest,EmailID,NonSubscriberUserID,Password)
VALUES
(@NonSubscriberName,@Address,@ContactNumber,@AreaOfInterest,@EmailID,@NonSubscriberUserID,@Password)

END

--------------------------------------------------------------------------------------


Create procedure usp_SelectSubscriberName
(
@SubscribedUserID VARCHAR (50),
@Password VARCHAR(10)
)
as      
BEGIN
IF EXISTS(select * from Subscribers  where  SubscribedUserID =@SubscribedUserID)
		select Password from Subscribers  where  Password= @Password
	
END

--------------------------------------------------------------------------------------


create procedure usp_SelectNonSubscriberName
(
@NonSubscriberUserID VARCHAR (50),
@Password VARCHAR(10)
)
as      
BEGIN
IF EXISTS(select * from NonSubscribers  where  NonSubscriberUserID =@NonSubscriberUserID)
		select Password from NonSubscribers  where  Password= @Password
	
END
 drop procedure usp_SelectNonSubscriberName
--------------------------------------------------------------------------------------


Create procedure usp_InsertDocument         
(        
    @BookID VARCHAR(20),         
    @BookTitle VARCHAR(20),        
    @DocumentType VARCHAR(20),        
    @Discipline VARCHAR(20),
	@Author VARCHAR(20),
	@PublishedDate VARCHAR(20),
	@OriginalPrice Decimal,
	@DiscountPrice Decimal,
	@ShortDescription NVARCHAR(200),
	@Documents NVARCHAR(200)
)        
as         
Begin         
    Insert into Document(BookID,BookTitle,DocumentType, Discipline,Author,PublishedDate,OriginalPrice,DiscountPrice,ShortDescription,Documents)         
    Values (@BookID,@BookTitle,@DocumentType, @Discipline,@Author,@PublishedDate,@OriginalPrice,@DiscountPrice,@ShortDescription,@Documents)         
End


--------------------------------------------------------------------------------------------------------


Create procedure usp_UpdateDocuments        
(        
   @BookID VARCHAR(20),         
    @BookTitle VARCHAR(20),        
    @DocumentType VARCHAR(20),        
    @Discipline VARCHAR(20),
	@Author VARCHAR(20),
	@PublishedDate VARCHAR(20),
	@OriginalPrice Decimal,
	@DiscountPrice Decimal,
	@ShortDescription NVARCHAR(200),
	@Documents NVARCHAR(200)   
)        
as        
begin        
   Update Document         
   set BookTitle=@BookTitle,        
   DocumentType=@DocumentType,        
   Discipline=@Discipline,      
   Author=@Author,  
   PublishedDate=@PublishedDate,
   OriginalPrice=@OriginalPrice,
   DiscountPrice=@DiscountPrice,
   ShortDescription=@ShortDescription,
   Documents=@Documents

   where BookID=@BookID        
End

------------------------------------------------------------------------------------------

Create procedure usp_SelectDocuments      
as      
Begin      
    select *      
    from Document   
    order by BookID      
End