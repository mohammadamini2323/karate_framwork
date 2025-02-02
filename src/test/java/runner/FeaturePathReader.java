package runner;

import java.util.ArrayList;
import java.util.List;

public class FeaturePathReader {

    public List<String> featurePaths;

    public FeaturePathReader() {
        this.featurePaths = new ArrayList<>();
        loadFeaturesPaths();
    }

    private void loadFeaturesPaths() {
        featurePaths.add("classpath:features/users.feature");
        featurePaths.add("classpath:features/postUser.feature");
        featurePaths.add("classpath:features/putUser.feature");
        featurePaths.add("classpath:features/treeRequest.feature");
        featurePaths.add("classpath:features/delete.feature");
        featurePaths.add("classpath:features/fourRequest.feature");
        featurePaths.add("classpath:features/bookStore/generateToken.feature");
        featurePaths.add("classpath:features/bookStore/bookStoreCU.feature");
    }

    public List<String> getFeaturePaths() {
        return featurePaths;
    }

    public void setFeaturePaths(List<String> featurePaths) {
        this.featurePaths = featurePaths;
    }
}