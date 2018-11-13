package controller.KMJ;

import java.util.List;

import project.DTO.ReviewDTO;

public class ReviewList {
	List<MJreviewDTO> reviewList;

	public List<MJreviewDTO> getReviewList() {
		return reviewList;
	}

	public void setReviewList(List<MJreviewDTO> reviewList) {
		this.reviewList = reviewList;
	}

	@Override
	public String toString() {
		return "ReviewList [reviewList=" + reviewList + "]";
	}

	
	
}
    