package com.koreait.workinapp.model.repository.requests;

import java.util.List;

import com.koreait.workinapp.domain.Requests;

public interface RequestsDAO {
	public List selectAll(int top_pk); //다
	public Requests select(int req_pk);//한건가져오기
	public void update(Requests requests); //수정
	public void delete(Requests requests); //삭제
	
	public List selectByWork(int top_pk);//승인 미완료 근무 / 휴가
	public List selectByApprove(int top_pk);//승인 완료 근무/휴가
	
	public List selectOneWork(int e_pk);//개인 근무
	public List selectOneDayoff(int e_pk);//개인 휴가
	
	public List selectByStatus(int e_pk);
	
	public List selectByEmployee(int e_pk);//한 사원의 전체 요청
	
	public void insert(Requests requests); //�슂泥� �벑濡�
	
	public List selectNoWork(int e_pk);
	public List selectNoDayoff(int e_pk);
	public List selectOkRequests(int e_pk);
	
	public List selectDayoff(int e_pk);
	public List selectWork(int e_pk);
}
