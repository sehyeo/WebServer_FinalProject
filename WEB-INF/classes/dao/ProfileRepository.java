package dao;

import java.util.ArrayList;
import dto.Profile;

public class ProfileRepository {
	private ArrayList<Profile> listOfProfiles = new ArrayList<>();
	private static ProfileRepository instance = new ProfileRepository();

	public static ProfileRepository getInstance() {
		return instance;
	}

	public ProfileRepository() {
		Profile Profile1 = new Profile("profile1");
		Profile1.setUserId("yewon");
		Profile1.setRole("");
		Profile1.setImg("jyw.png");
		

		Profile Profile2 = new Profile("profile2");
		Profile1.setUserId("Seunghyeon");
		Profile2.setRole("special");
		Profile2.setImg("ksh.png");
		
		listOfProfiles.add(Profile1);
		listOfProfiles.add(Profile2);
	}
	
	public ArrayList<Profile> getAllProfiles() {
		return listOfProfiles;
	}
	
	public Profile getProfileById(String profileId) {
		Profile ProfileById = null;
		
		for (int i=0; i<listOfProfiles.size(); i++) {
			Profile Profile = listOfProfiles.get(i);
			if (Profile!=null && Profile.getUserId() != null && Profile.getUserId().equals(profileId)) {
				ProfileById = Profile;
				break;				
			}			
		}
		return ProfileById;
	}	
	
	public Profile getImgByProfileId(String profileId) {
        Profile ImgByUserId = null;

        for (int i = 0; i < listOfProfiles.size(); i++) {
            Profile Profile = listOfProfiles.get(i);
            if (Profile != null && Profile.getUserId() != null && Profile.getUserId().equals(profileId)) {
            	ImgByUserId = Profile;
                break;
            }
        }
        return ImgByUserId;
    }
	
	public void addProfile(Profile Profile) {
		listOfProfiles.add(Profile);
	}
}