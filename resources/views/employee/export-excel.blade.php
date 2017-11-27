<html>
<body>
<!-- Horizontal alignment/big title -->
<td align="right"><h1>Big title</h1></td>

<!--  Vertical alignment/bold -->
<td valign="middle"><b>Bold cell</b></td>

<!-- Rowspan/bold -->
<td rowspan="3"><strong>Bold cell</strong></td>

<!-- Colspan/italic -->
<td colspan="6"><i>Italic cell</i></td>

<!-- Width/image -->
<td width="100"><img src="img.jpg" /></td>

<!-- Height/black background -->
<td height="100" style="background-color: #000000;">Cell with height of 100</td>

// sử dụng tag style để css
<style>
    tr td {
        background-color: #ffffff;
    }

    tr > td {
        border-bottom: 1px solid #000000;
    }
</style>
</body>
</html>