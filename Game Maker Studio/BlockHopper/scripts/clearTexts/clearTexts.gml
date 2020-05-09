/// @description clearTexts();
// remove all the text field objects
if instance_exists(oTextField) {
    with(oTextField) {
        instance_destroy();
    }
}
