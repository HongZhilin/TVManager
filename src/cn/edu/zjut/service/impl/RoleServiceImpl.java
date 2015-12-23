package cn.edu.zjut.service.impl;

import java.util.List;

import cn.edu.zjut.entity.Role;
import cn.edu.zjut.mapper.RoleMapper;
import cn.edu.zjut.service.RoleService;

public class RoleServiceImpl implements RoleService{

	private RoleMapper roleMapper;
	
	public List<Role> listAllRoles() {
		return roleMapper.listAllRoles();
	}

	public void deleteRoleById(int roleId) {
		roleMapper.deleteRoleById(roleId);
	}

	public Role getRoleById(int roleId) {
		return roleMapper.getRoleById(roleId);
	}

	public boolean insertRole(Role role) {
		if(roleMapper.getCountByName(role)>0)
			return false;
		else{
			roleMapper.insertRole(role);
			return true;
		}
	}

	public boolean updateRoleBaseInfo(Role role) {
		if(roleMapper.getCountByName(role)>0)
			return false;
		else{
			roleMapper.updateRoleBaseInfo(role);
			return true;
		}
	}
	
	public void updateRoleRights(Role role) {
		roleMapper.updateRoleRights(role);
	}

	public RoleMapper getRoleMapper() {
		return roleMapper;
	}

	public void setRoleMapper(RoleMapper roleMapper) {
		this.roleMapper = roleMapper;
	}

}
