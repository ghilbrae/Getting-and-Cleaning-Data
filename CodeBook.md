describes the variables, the data, and any transformations or work that you performed to clean up the data

## About the setup

Wearable computing is a very active data science right now. Many companies are competing to develop new technology to appeal to new users.

The data used in this study, from the uman Activity Recognition database, has been obtained from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone (Samsung Galaxy S) with embedded inertial sensors (accelerometers).

## Raw data

### Labels
* 1 -> WALKING
* 2 -> WALKING_UPSTAIRS
* 3 -> WALKING_DOWNSTAIRS
* 4 -> SITTING
* 5 -> STANDING
* 6 -> LAYING

## Main goals

The business wants to assign ID# to the dogs, and codewords to the address to make this data anonymous. There isn't anything to do to the comments--since free text is all over the place.

## Codebook

As the data in the Inertial folders is unlabelled data and this data is asked to be eliminated in step 2, it will not be processed since the beginning.

The dog's name was transformed into an IDNumber (unique) (1-50), the address was transformed into a factor, OwnerName (levels Alice, Bob, Charlie, Deborah, Ernest and Fred), time and date walked were counted to make WalksPerWeek1, WalksPerWeek2, and WalksPerWeek3. Week1 begins at 00:01UTC on July1, 2014, Week2 begins at 00:01UTC on July8, 2014, Week3 begins at 00:01UTC on July15, 2014. Health was summarized as HealthWeek1, HealthWeek2, and HealthWeek3. It is a factor with two levels, Well and Sick. If the dog was sick at any walk during that week, dog was marked sick, else dog was marked well. Dog Size was converted into a factor: Large, Medium and Small are the levels. Comments are dropped. Pay is transformed into PayWeek1, PayWeek2, PayWeek3, which is a factor that has two levels (Yes, and No) for correct pay paid during that week.
