package dao;

import java.util.ArrayList;
import dto.Post;

public class PostRepository {
	private ArrayList<Post> listOfPosts = new ArrayList<>();
	private static PostRepository instance = new PostRepository();

	public static PostRepository getInstance() {
		return instance;
	}

	public PostRepository() {
		Post Post1 = new Post("CS1301-01", "웹서버컴퓨팅");
		Post1.setAuthor("작성자");
		Post1.setContents("백엔드개발을 위한 웹 서버 프로그래밍을 학습한다. 웹 서버 프로그래밍 기술 중에서 수요가 높은 자바 기반 JSP를  중점적으로 학습하며,  웹서버컴퓨팅 핵심 기술인  자바서블릿 / MySQL / JDBC / 웹MVC모델을 학습한다. \r\n"
				+ "이러한 기술을 사용하여 웹 서버의 핵심 기능인 회원 가입 / 제품 등록 / 장바구니 / 데이터베이스 연동 / 게시판을 구현한 웹 쇼핑몰을 개발한다. ");
		Post1.setCategory("WEB");
		Post1.setReleaseDate("2024/03/01");
		Post1.setHashtag("소프트웨어학과");
		Post1.setReference("sample.txt");
		
		listOfPosts.add(Post1);
	}
	
	public ArrayList<Post> getAllPosts() {
		return listOfPosts;
	}
	
	public Post getPostById(String PostId) {
		Post PostById = null;
		
		for (int i=0; i<listOfPosts.size(); i++) {
			Post Post = listOfPosts.get(i);
			if (Post!=null && Post.getPostId() != null && Post.getPostId().equals(PostId)) {
				PostById = Post;
				break;				
			}			
		}
		return PostById;
	}	
	
	public Post getPostByTitleAndReference(String title, String reference) {
        Post PostByTitleAndReference = null;

        for (int i = 0; i < listOfPosts.size(); i++) {
            Post Post = listOfPosts.get(i);
            if (Post != null && Post.getTitle() != null && Post.getReference() != null &&
                    Post.getTitle().equals(title) && Post.getReference().equals(reference)) {
            	PostByTitleAndReference = Post;
                break;
            }
        }
        return PostByTitleAndReference;
    }
	
	public void addPost(Post Post) {
		listOfPosts.add(Post);
	}
}