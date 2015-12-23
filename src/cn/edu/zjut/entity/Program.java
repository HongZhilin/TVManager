package cn.edu.zjut.entity;

import java.util.Date;

import cn.edu.zjut.util.Tools;

public class Program {
	
	private Integer id;
	private String channelName;
	private String province;
	private Integer channelId;
	private String program;
	private Date startTime;
	private Date endTime;
	private String duringTime;
	private String startTimeShow;
	private String endTimeShow;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getChannelName() {
		return channelName;
	}
	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public Integer getChannelId() {
		return channelId;
	}
	public void setChannelId(Integer channelId) {
		this.channelId = channelId;
	}
	public String getProgram() {
		return program;
	}
	public void setProgram(String program) {
		this.program = program;
	}
	
	public String getDuringTime() {
		return duringTime;
	}
	public void setDuringTime(String duringTime) {
		this.duringTime = duringTime;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getStartTimeShow() {
		startTimeShow = Tools.date2Str(startTime, "yyyy-MM-dd HH:mm:ss");
		return startTimeShow;
	}
	public void setStartTimeShow(String startTimeShow) {
		this.startTimeShow = startTimeShow;
	}
	public String getEndTimeShow() {
		endTimeShow = Tools.date2Str(endTime, "yyyy-MM-dd HH:mm:ss");
		return endTimeShow;
	}
	public void setEndTimeShow(String endTimeShow) {
		this.endTimeShow = endTimeShow;
	}
	
	

}
