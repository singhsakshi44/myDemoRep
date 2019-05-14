DEFINE QUERY CustOrd FOR Customer, Order.
DEFINE VARIABLE iCount AS INTEGER NO-UNDO.
 
OPEN QUERY CustOrd FOR EACH Customer WHERE Customer.CustNum = 1,
    EACH Order OF Customer.
GET FIRST CustOrd.
DO WHILE AVAILABLE(Customer):
    DISPLAY Order.Ordernum WITH 20 DOWN.
    DOWN.
    iCount = iCount + 1.
    GET NEXT CustOrd.
END.
/* Your are off-end in the query at this point */
GET LAST CustOrd.
MESSAGE
    'There are' iCount 'orders for Customer 1'
    SKIP
    'Last order number is' Order.Ordernum
    VIEW-AS ALERT-BOX.