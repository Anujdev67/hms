package com.spring.hms.repository;

import com.spring.hms.model.TestAndScans;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class TestAndScansRepository {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<TestAndScans> findAll() {
        String sql = "SELECT * FROM testandscans WHERE deleted = false";
        return jdbcTemplate.query(sql, new TestAndScansRowMapper());
    }

    public void save(TestAndScans test) {
        if (test.getId() == null) {
            String sql = "INSERT INTO testandscans (type, description, status, deleted) VALUES (?, ?, ?, ?)";
            jdbcTemplate.update(sql, test.getType(), test.getDescription(), test.getStatus(), test.isDeleted());
        } else {
            String sql = "UPDATE testandscans SET type = ?, description = ?, status = ?, deleted = ? WHERE id = ?";
            jdbcTemplate.update(sql, test.getType(), test.getDescription(), test.getStatus(), test.isDeleted(), test.getId());
        }
    }

    public void delete(Long id) {
        String sql = "DELETE FROM testandscans WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    public void softDelete(Long id) {
        String sql = "UPDATE testandscans SET deleted = true WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    public TestAndScans findById(Long id) {
        String sql = "SELECT * FROM testandscans WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new TestAndScansRowMapper());
    }

    private static class TestAndScansRowMapper implements RowMapper<TestAndScans> {
        @Override
        public TestAndScans mapRow(ResultSet rs, int rowNum) throws SQLException {
            TestAndScans test = new TestAndScans();
            test.setId(rs.getLong("id"));
            test.setType(rs.getString("type"));
            test.setDescription(rs.getString("description"));
            test.setStatus(rs.getString("status"));
            test.setDeleted(rs.getBoolean("deleted"));
            return test;
        }
    }
}
