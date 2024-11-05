package com.spring.hms.repository;

import com.spring.hms.model.Lab;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class LabRepository {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Lab findById(Long id) {
        String sql = "SELECT * FROM laboperator WHERE id = ? AND deleted = false";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new LabRowMapper());
    }

    public List<Lab> findAll() {
        String sql = "SELECT * FROM laboperator WHERE deleted = false";
        return jdbcTemplate.query(sql, new LabRowMapper());
    }

    public void save(Lab lab) {
        if (lab.getId() == null) {
            String sql = "INSERT INTO laboperator (name, description, deleted) VALUES (?, ?, ?)";
            jdbcTemplate.update(sql, lab.getName(), lab.getDescription(), lab.isDeleted());
        } else {
            String sql = "UPDATE laboperator SET name = ?, description = ?, deleted = ? WHERE id = ?";
            jdbcTemplate.update(sql, lab.getName(), lab.getDescription(), lab.isDeleted(), lab.getId());
        }
    }

    public void delete(Long id) {
        String sql = "DELETE FROM laboperator WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    public void softDelete(Long id) {
        String sql = "UPDATE laboperator SET deleted = true WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    private static class LabRowMapper implements RowMapper<Lab> {
        @Override
        public Lab mapRow(ResultSet rs, int rowNum) throws SQLException {
            Lab lab = new Lab();
            lab.setId(rs.getLong("id"));
            lab.setName(rs.getString("name"));
            lab.setDescription(rs.getString("description"));
            lab.setDeleted(rs.getBoolean("deleted"));
            return lab;
        }
    }
}
