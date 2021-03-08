trigger sampletrigger on Account (before insert) {

    for(account a: trigger.new)
    {
        a.name='ivota';
    }
}