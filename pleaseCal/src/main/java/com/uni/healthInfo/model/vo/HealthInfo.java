package com.uni.healthInfo.model.vo;

public class HealthInfo {
	
	private int userNo;
	private int age;
	private char gen;
	private int height;
	private int weight;
	private int active;
	
	public HealthInfo() {
		// TODO Auto-generated constructor stub
	}

	public HealthInfo(int userNo, int age, char gen2, int height, int weight, int active) {
		super();
		this.userNo = userNo;
		this.age = age;
		this.gen = gen2;
		this.height = height;
		this.weight = weight;
		this.active = active;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public char getGen() {
		return gen;
	}

	public void setGen(char gen) {
		this.gen = gen;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	@Override
	public String toString() {
		return "HealthInfo [userNo=" + userNo + ", age=" + age + ", gen=" + gen + ", height=" + height + ", weight="
				+ weight + ", active=" + active + "]";
	}
	
	
	
	
	
}
