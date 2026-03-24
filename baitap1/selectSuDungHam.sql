SELECT *
FROM Subject
WHERE Credit = (
    SELECT MAX(Credit)
    FROM Subject
);

SELECT DISTINCT s.SubId, s.SubName, s.Credit, s.Status, m.Mark
FROM Subject s
JOIN Mark m ON s.SubId = m.SubId
WHERE m.Mark = (
    SELECT MAX(Mark)
    FROM Mark
);

SELECT 
    st.StudentId,
    st.StudentName,
    st.Address,
    st.Phone,
    st.Status,
    st.ClassId,
    AVG(m.Mark) AS DiemTrungBinh
FROM Student st
JOIN Mark m ON st.StudentId = m.StudentId
GROUP BY 
    st.StudentId,
    st.StudentName,
    st.Address,
    st.Phone,
    st.Status,
    st.ClassId
ORDER BY DiemTrungBinh DESC;