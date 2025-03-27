trigger SponsorEmailIsRequired on CAMPX__Sponsor__c(before insert) {
  for (CAMPX__Sponsor__c sponsor : Trigger.new) {
    if (sponsor.CAMPX__Email__c == null) {
      sponsor.addError('A sponsor can not be created without an email address');
    }
  }

}
