package com.team.honeybee.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.*;

import com.team.honeybee.domain.*;
import com.team.honeybee.mapper.*;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	public boolean addMember(MemberDto member) {
		
		String encodedPassword = passwordEncoder.encode(member.getPw());
		
		member.setPw(encodedPassword);
		
		int cnt1 = mapper.insertMember(member);
		
		int cnt2 = mapper.insertAuth(member.getMemberId(),"ROLE_USER");
		
		return cnt1 == 1 && cnt2 == 1;
	}

	public boolean hasMemberId(String memberId) {
		
		return mapper.countMemberId(memberId) > 0;
	}

	public boolean hasMemberEmail(String email) {
		return mapper.countMemberEmail(email) > 0;
	}

	public boolean hasMemberNickName(String nickname) {
		return mapper.countMemberNickName(nickname) > 0;
	}
	
}
