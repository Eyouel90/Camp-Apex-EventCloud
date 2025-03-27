trigger StatusChangeDater on CAMPX__Event__c(before update) {
  for (CAMPX__Event__c event : Trigger.new) {
    CAMPX__Event__c oldEvent = Trigger.oldMap.get(event.Id);

    if (
      oldEvent != null &&
      event.CAMPX__Status__c != oldEvent.CAMPX__Status__c
    ) {
      event.CAMPX__StatusChangeDate__c = Datetime.now();
    }
  }

}
