package entity;

public class PointsRulesEntity {
    private int id_rule;
    private String content;
    private int points;

    public int getId_rule() {
        return id_rule;
    }

    public void setId_rule(int id_rule) {
        this.id_rule = id_rule;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public PointsRulesEntity(int id_rule, String content, int points) {
        this.id_rule = id_rule;
        this.content = content;
        this.points = points;
    }

    public PointsRulesEntity() {
    }
}
