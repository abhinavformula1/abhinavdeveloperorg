public class Flower {
    public static void wilt(Integer numberOfPetals){
        if(numberOfPetals >= 1){
            System.debug('Number of Petels : '+ numberOfPetals);
            numberOfPetals--;
        }
    }
}