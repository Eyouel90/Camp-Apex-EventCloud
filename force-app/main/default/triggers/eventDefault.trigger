trigger eventDefault on CAMPX__Event__c(before insert) {
  List<CAMPX__Event__c> eventsToUpdate = new List<CAMPX__Event__c>();

  for (CAMPX__Event__c event : Trigger.new) {
    if (event.CAMPX__Status__c != 'Planning') {
      event.CAMPX__Status__c = 'Planning';
    }

    eventsToUpdate.add(event);
  }

}
