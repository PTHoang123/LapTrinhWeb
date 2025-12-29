package model;

public class Category {
    private int categoryId;
    private String name;
    private int productCount;

    public Category() {}

    public Category(int categoryId, String name, int productCount) {
        this.categoryId = categoryId;
        this.name = name;
        this.productCount = productCount;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getProductCount() {
        return productCount;
    }

    public void setProductCount(int productCount) {
        this.productCount = productCount;
    }
}