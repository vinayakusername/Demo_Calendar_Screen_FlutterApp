import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_share/flutter_share.dart';


/*
  If we want to build a magazine/newspaper application (or something like that) with Flutter, 
  you may want to render some HTML content (which usually is fetched from a remote server). 
  So to render HTML content we need to use plugin called flutter_html.
 */

class RenderHTMLContent extends StatelessWidget 
{
  const RenderHTMLContent({ Key? key }) : super(key: key);

   final _htmlContent = """
                  <div>
                    <p>
                        A significant increase in blood pressure (BP) appears predictive of therapeutic response to vascular endothelial growth factor (VEGF) inhibitors but does not limit treatment duration even in patients with severe elevations, suggests a study. 
                        <br> <br>\r\nA total of 155 patients receiving treatment with VEGF inhibitors were analyzed in this retrospective chart review. 
                        Time to progression (TTP) in those with or without a significant increase in BP (increase in systolic BP >20 mmHg or >10 mmHg in diastolic BP) was the primary endpoint. 
                        <br> <br>\r\nSecondary endpoints included treatment interruption, therapy discontinuation due to documented adverse effects, and time to BP elevation. 
                        The authors performed subgroup analyses in patients receiving bevacizumab and oral tyrosine kinase inhibitors. 
                        <br> <br>\r\n\r\nOf the patients, 93 (60%) developed a significant elevation in BP, with a median time to development of 47 days. 
                        Those with significant BP increases had a longer median TTP than patients without (8.1 vs. 4.4 months; p=0.002). 
                        <br> <br>\r\nNo between-group differences were observed with regard to treatment interruption or discontinuation due to a documented adverse effect. 
                        Outcomes were also similar in patients receiving bevacizumab and oral tyrosine kinase inhibitors. 
                       <br> <br>\r\nAnalysis of the impact of BP elevation severity revealed the greater likelihood of treatment interruption among patients with severe BP elevation, but discontinuation rates were comparable across groups.
                       \r\n“VEGF inhibitors are known to cause hypertension,” the authors noted.<sup>1,2</sup>\r\n<br> <br>\r\nReference: 1. J Oncol Pharm Pract. 2022;28:265273. 
                       2. Significant BP elevation predicts response to VEGF inhibitors. 
                    </p> 

                 </div> 
                         
                        """;
/*
   final _htmlContent = """
  <div>
    <h1>Examples to demonstrate subscript text</h1>

    <p> Chemical formula of water is H<sub>2</sub>O</p>
    
    <h1>Examples to demonstrate superscript text</h1>

    <p>X<sup>4</sup> + Y<sup>6</sup></p>

    <p>8<sup>th</sup> of Apirl</p>
  
  </div>
  """;
*/
  @override
  Widget build(BuildContext context) 
  {
     return Scaffold(
      appBar: AppBar
      (
        title: const Text('Demonstration of Rendering of HTML Content'),
        actions: 
        [
          IconButton
          (
            onPressed:()=> _shareContent(), 
            icon: Icon(Icons.share)
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Html(
            data: _htmlContent,
            // Styling with CSS (not real CSS)
            style: {
              'h1': Style(color: Colors.red),
              'p': Style(color: Colors.black87, fontSize: FontSize.xLarge),
              'ul': Style(margin: const EdgeInsets.symmetric(vertical: 20))
            },
          ),
        ),
      ),
    );
  }
 
  void _shareContent()
  {
    FlutterShare.share(title: 'Hello World');
  }

}
