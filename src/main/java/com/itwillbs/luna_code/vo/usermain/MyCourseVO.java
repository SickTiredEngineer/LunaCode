package com.itwillbs.luna_code.vo.usermain;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class MyCourseVO extends MyClassVO {
	
    private int current_lesson_count;
    private boolean is_completed;
    private int progress_percent;
}
