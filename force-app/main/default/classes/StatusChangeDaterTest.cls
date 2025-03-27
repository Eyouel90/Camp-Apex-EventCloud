@isTest
public with sharing class StatusChangeDaterTest {
  @isTest
  public static void testStatusChangeDater() {
    // Create a test record
    CAMPX__Event__c testEvent = new CAMPX__Event__c(
      Name = 'Test Event',
      CAMPX__Status__c = 'Active'
    );
    insert testEvent;

    // Update the status of the account
    CAMPX__Event__c eventToUpdate = [
      SELECT Id, Name, CAMPX__Status__c
      FROM CAMPX__Event__c
      WHERE Id = :testEvent.Id
    ];
    eventToUpdate.CAMPX__Status__c = 'Active';
    update eventToUpdate;

    // Query the account to check if the status change date is updated
    CAMPX__Event__c updatedEvent = [
      SELECT Id, Name, CAMPX__Status__c, CAMPX__StatusChangeDate__c
      FROM CAMPX__Event__c
      WHERE Id = :testEvent.Id
    ];

    // Assert that the Status Change Date is not null and should be the day
    System.assertNotEquals(
      null,
      updatedEvent.CAMPX__StatusChangeDate__c,
      'Status Change Date should not be null'
    );
    System.assertEquals(
      System.now().date(),
      updatedEvent.CAMPX__StatusChangeDate__c.date(),
      'Status Date Change should be today'
    );
  }
}
