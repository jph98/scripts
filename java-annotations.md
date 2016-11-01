Example of a validation:
```
@Target(AnnotationTarget.FUNCTION,
        AnnotationTarget.PROPERTY_GETTER,
        AnnotationTarget.PROPERTY_SETTER,
        AnnotationTarget.FIELD,
        AnnotationTarget.ANNOTATION_CLASS,
        AnnotationTarget.CONSTRUCTOR,
        AnnotationTarget.VALUE_PARAMETER)
@Retention(AnnotationRetention.RUNTIME)
@Constraint(validatedBy = arrayOf(AddressValidator::class))
@MustBeDocumented
annotation class Address(
        val message: String = "{validation.address.invalid}",
        val groups: Array<KClass<*>> = arrayOf(),
        val payload: Array<KClass<out Payload>> = arrayOf()
)
```

and an example of a validator

```
class AddressValidator : ConstraintValidator<Phone, String> {

    var phoneNumberUtil: PhoneNumberUtil? = null

    override fun initialize(constraintAnnotation: Phone?) {
        phoneNumberUtil = PhoneNumberUtil.getInstance()
    }

    override fun isValid(value: String?, context: ConstraintValidatorContext?): Boolean {
        if (value == null || context == null || phoneNumberUtil == null) {
            return true
        }
        return try {
            PhoneFormatterHelper.format(value, Locale.GERMANY)
            return true
        } catch (ex: IllegalArgumentException) {
            false
        }
    }
}
```
    
