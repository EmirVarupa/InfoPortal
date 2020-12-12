/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author emir i amad
 */
public class postbean {
    private String title = "";
    private String summary = "";
    private String postcontent = "";
    
    
    public postbean(){
        
    }
        public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getPostContent() {
        return postcontent;
    }

    public void setPostContent(String postcontent) {
        this.postcontent = postcontent;
    }   
    
}