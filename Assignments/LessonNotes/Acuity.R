library(AcuityView) 
library(fftwtools) 
library(imager)

#### TESTING OUT 

img <- load.image("terrier.jpeg")

dim(img)

img <- resize(img, 512, 512) # resize - will chnage the aspect ratio 

AcuityView(photo = img, distance = 5, realWidth = 4,
           eyeResolutionX = 8, eyeResolutionY = NULL, 
           plot=T, output = "Terrier_AsAClow.jpg")


#### Five animals from the database 

# 1. Giraffe viewing an image of sub-saharan Africa 

# convert CPD to MRA for the package (MRA = 1/CPD )
giraffe_mra = 1/25.46 
giraffe_img = resize(load.image("subsaharan_africa_giraffe.jpeg"), 512, 512)

AcuityView(photo = giraffe_img, distance = 3, realWidth = 10,
           eyeResolutionX = giraffe_mra, eyeResolutionY = NULL, 
           plot=T, output = "giraffe_vision.jpg")

# 2. Dog viewing a picture of a family  
dog_mra = 1/14.57
dog_img = resize(load.image("family_pic.jpeg"), 512, 512)

AcuityView(photo = dog_img, distance = 3, realWidth = 0.5,
           eyeResolutionX = dog_mra, eyeResolutionY = NULL, 
           plot=T, output = "dog_vision.jpg")


# 3. Cat viewing picture of person 
cat_mra = 1/8.85
cat_img = resize(load.image("dog_pic.jpeg"), 512, 512)
family_img = resize(load.image("family_pic.jpeg"), 512, 512)

AcuityView(photo = family_img, distance = 10, realWidth = 0.5,
           eyeResolutionX = cat_mra, eyeResolutionY = NULL, 
           plot=T, output = "cat_vision_offamily.jpg")


# 4. Acouti paca viewing the rainforest 
paca_mra = 1/2.8
paca_img = resize(load.image("paca_image.jpeg"), 512, 512)

AcuityView(photo = paca_img, distance = 5, realWidth = 5,
           eyeResolutionX = paca_mra, eyeResolutionY = NULL, 
           plot=T, output = "paca_vision.jpg")


# 5. 









