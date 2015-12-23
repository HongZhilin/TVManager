package cn.edu.zjut.service;

import java.util.List;

import cn.edu.zjut.entity.Role;

public interface RoleService {
	List<Role> listAllRoles();
	Role getRoleById(int roleId);
	
	boolean insertRole(Role role);
	boolean updateRoleBaseInfo(Role role);
	
	void deleteRoleById(int roleId);
	void updateRoleRights(Role role);
}
