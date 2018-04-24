public class UserStateHandler {
   
    private UserState userState;
    
    public UserStateHandler(){
        userState=null;
    }
    
    public void setUserState(UserState userSta){
        userState=userSta;
    }
    
    public UserState getUserState(){
        return userState;
    }

}